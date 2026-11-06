#!/bin/bash

set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
CLI="$ROOT/bin/gurt"
TMPDIR=""

export PATH="$ROOT/bin:$PATH"

pass() {
  printf 'ok - %s\n' "$1"
}

fail() {
  printf 'not ok - %s\n' "$1" >&2
  exit 1
}

assert_output_contains() {
  local description="$1"
  local output="$2"
  local expected="$3"

  if [[ $output != *"$expected"* ]]; then
    printf 'Expected output to contain: %s\n' "$expected" >&2
    printf 'Actual output:\n%s\n' "$output" >&2
    fail "$description"
  fi

  pass "$description"
}

cleanup() {
  [[ -n $TMPDIR && -d $TMPDIR ]] && rm -rf "$TMPDIR"
}
trap cleanup EXIT

output=$("$CLI" --help)
assert_output_contains "main help renders" "$output" "Gurt command center"
assert_output_contains "main help includes hardware group" "$output" "hw"
assert_output_contains "main help includes package group" "$output" "pkg"
if grep -Eq '^  [a-z0-9-]+[[:space:]].*\([0-9]+\)$' <<<"$output"; then
  fail "main help does not show group counts"
fi
pass "main help does not show group counts"

output=$("$CLI" commands)
assert_output_contains "commands lists documented commands" "$output" "gurt theme set <theme-name>"

"$CLI" commands --json | jq -e '.ok == true and (.commands | length >= 200)' >/dev/null
pass "commands --json is valid JSON with full bin coverage"

"$CLI" commands --json | jq -e 'all(.commands[]; .summary != "undocumented")' >/dev/null
pass "all included commands have summaries"

"$CLI" commands --json | jq -e 'all(.commands[]; has("binary") and has("filename_route") and has("routes") and (has("legacy") | not) and (has("usage") | not) and (has("visibility") | not) and (has("mutates") | not) and (has("interactive") | not))' >/dev/null
pass "JSON uses binary/routes and omits legacy/usage/extra metadata"

"$CLI" commands --check >/dev/null
pass "commands --check passes"

"$CLI" commands --all >/dev/null
pass "commands --all does not crash"

"$CLI" commands --all --json | jq -e '.commands[] | select(.route == "gurt hyprland window gaps toggle" and .summary != "undocumented")' >/dev/null
pass "fallback commands are inferred and documented"

"$CLI" commands --all --json | jq -e '.commands[] | select(.route == "gurt dev benchmark")' >/dev/null
pass "benchmark command is discoverable in all commands"

"$CLI" commands --json | jq -e '.commands[] | select(.binary == "gurt-pkg-add" and .route == "gurt pkg add" and .filename_route == "gurt pkg add" and (.routes | index("gurt pkg add")))' >/dev/null
pass "JSON exposes direct pkg add route"

"$CLI" commands --json | jq -e '.commands[] | select(.binary == "gurt-refresh-pacman" and .requires_sudo == true)' >/dev/null
pass "sudo metadata marks sudo commands"

output=$("$CLI" theme --help)
assert_output_contains "group help renders" "$output" "Theme commands"

output=$("$CLI" install --help)
assert_output_contains "install group help renders" "$output" "Install commands"
assert_output_contains "install group includes browser route" "$output" "gurt install browser"

output=$("$CLI" install)
assert_output_contains "bare group renders help instead of picker" "$output" "Install commands"
assert_output_contains "bare group includes browser route" "$output" "gurt install browser"

output=$("$CLI" toggle)
assert_output_contains "bare root command with children renders help" "$output" "Toggle commands"
assert_output_contains "bare toggle help includes child route" "$output" "gurt toggle waybar"

output=$("$CLI" pkg --help)
assert_output_contains "package group includes pkg add fallback route" "$output" "gurt pkg add <packages...>"

output=$("$CLI" restart --help)
assert_output_contains "restart group includes inferred commands" "$output" "gurt restart btop"
assert_output_contains "restart group includes all restart commands" "$output" "gurt restart wifi"

output=$("$CLI" hw --help)
assert_output_contains "hardware group help renders" "$output" "gurt hw asus rog"
assert_output_contains "hardware group includes touchpad" "$output" "gurt hw touchpad"

output=$("$CLI" hw asus)
assert_output_contains "partial hardware prefix renders matching commands" "$output" "gurt hw asus rog"
assert_output_contains "partial hardware prefix includes nested match" "$output" "gurt hw asus zenbook ux5406aa"

output=$("$CLI" menu --help)
assert_output_contains "menu group includes share fallback route" "$output" "gurt menu share"

output=$("$CLI" share)
assert_output_contains "bare required-arg alias renders CLI help" "$output" "Usage:"
assert_output_contains "bare share help uses canonical route" "$output" "gurt share <clipboard|file|folder> [path...]"

output=$("$CLI" menu share)
assert_output_contains "bare required-arg filename route renders CLI help" "$output" "gurt share <clipboard|file|folder> [path...]"

output=$("$CLI" branch set)
assert_output_contains "bare required-choice route renders CLI help" "$output" "gurt branch set <master|rc|dev>"

CLI="$CLI" python3 <<'PY'
import json
import os
import subprocess
import sys

cli = os.environ['CLI']
commands = json.loads(subprocess.check_output([cli, 'commands', '--json'], text=True))['commands']
by_group = {}
for command in commands:
  binary = command['binary']
  stem = binary.removeprefix('gurt-')
  group = stem.split('-', 1)[0]
  filename_route = 'gurt ' + stem.replace('-', ' ')
  by_group.setdefault(group, []).append((binary, filename_route, command['route']))

missing = []
for group, rows in sorted(by_group.items()):
  proc = subprocess.run([cli, group, '--help'], text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  output = proc.stdout + proc.stderr
  if proc.returncode != 0:
    missing.append((group, '<group-help-failed>', f'exit {proc.returncode}'))
    continue
  for binary, filename_route, canonical_route in rows:
    if filename_route not in output and canonical_route not in output and binary not in output:
      missing.append((group, binary, filename_route))

if missing:
  for row in missing:
    print('\t'.join(row), file=sys.stderr)
  sys.exit(1)
PY
pass "every filename-derived group help represents its bins"

output=$(timeout 5 "$CLI" theme set --help)
assert_output_contains "command help renders without executing" "$output" "Binary:"
assert_output_contains "theme set help names binary" "$output" "gurt-theme-set"

output=$(timeout 5 "$CLI" update --help)
assert_output_contains "mutating command help does not execute target" "$output" "gurt-update"
assert_output_contains "root command help shows related child commands" "$output" "gurt update perform"

output=$("$CLI" screenshot --help)
assert_output_contains "root alias resolves to command help" "$output" "gurt-capture-screenshot"

"$CLI" commands --json | jq -e '.commands[] | select(.binary == "gurt-capture-screenshot") | .aliases | index("gurt screenshot")' >/dev/null
pass "aliases are included in JSON metadata"

output=$("$CLI" pkg add --help)
assert_output_contains "pkg add help resolves" "$output" "gurt-pkg-add"
assert_output_contains "pkg add help shows direct route" "$output" "gurt pkg add <packages...>"

output=$("$CLI" system reboot --help)
assert_output_contains "system command help is safe" "$output" "gurt-system-reboot"

output=$("$CLI" dev benchmark --repeat=1)
assert_output_contains "benchmark command runs" "$output" "Gurt CLI benchmark"

"$CLI" theme list >/dev/null
pass "safe dispatch works for theme list"

"$CLI" theme current >/dev/null
pass "safe dispatch works for theme current"

"$CLI" font list >/dev/null
pass "safe dispatch works for font list"

"$CLI" font current >/dev/null
pass "safe dispatch works for font current"

for binary in \
  gurt-update \
  gurt-theme-set \
  gurt-capture-screenshot \
  gurt-system-reboot \
  gurt-pkg-add; do
  [[ -x $ROOT/bin/$binary ]] || fail "binary is executable: $binary"
  pass "binary is executable: $binary"
done

while IFS= read -r binary_path; do
  header=$(awk '
    NR == 1 && /^#!/ { next }
    /^[[:space:]]*$/ { if (seen) print; next }
    /^[[:space:]]*#/ { seen=1; print; next }
    { exit }
  ' "$binary_path")

  grep -q '^# gurt:summary=' <<<"$header" || fail "metadata summary is present: $binary_path"
  ! grep -q '^# gurt:binary=' <<<"$header" || fail "metadata does not repeat inferred binary: $binary_path"
  ! grep -q '^# gurt:args=$' <<<"$header" || fail "metadata does not include empty args: $binary_path"
  ! grep -Eq '^# gurt:(legacy|usage|visibility|mutates|interactive)=' <<<"$header" || fail "metadata avoids removed fields: $binary_path"
  ! grep -Eq '^# gurt:requires-sudo=false$' <<<"$header" || fail "metadata omits false booleans: $binary_path"
done < <(find "$ROOT/bin" -maxdepth 1 -type f -executable -name 'gurt-*' | sort)
pass "all executable bins have slim self-documenting metadata"

TMPDIR=$(mktemp -d)
ln -s "$CLI" "$TMPDIR/gurt"

{
  printf '#!/bin/bash\n\n'
  printf '# ordinary comments are fine\n'
  printf '# gurt:this malformed line should be ignored\n'
  printf '# gurt:group=weird\n'
  printf '# gurt:name=test\n'
  printf '# gurt:summary=Survives malformed metadata comments\n'
  printf '# gurt:made-up=value\n'
  printf 'echo weird-ok\n'
} >"$TMPDIR/gurt-weird-test"
chmod +x "$TMPDIR/gurt-weird-test"

{
  printf '#!/bin/bash\n\n'
  printf '# a partial metadata header should not destroy fallback routing\n'
  printf '# gurt:summary=Partial metadata keeps inferred route\n'
  printf '# gurt:made-up=value\n'
  printf 'echo partial-ok\n'
} >"$TMPDIR/gurt-partial-meta-test"
chmod +x "$TMPDIR/gurt-partial-meta-test"

{
  printf '#!/bin/bash\n\n'
  printf 'echo body-metadata-ok\n'
  printf '# gurt:group=wrong\n'
  printf '# gurt:name=wrong\n'
} >"$TMPDIR/gurt-body-metadata-test"
chmod +x "$TMPDIR/gurt-body-metadata-test"

"$TMPDIR/gurt" commands --all --json | jq -e '.commands[] | select(.route == "gurt weird test" and .summary == "Survives malformed metadata comments")' >/dev/null
pass "unknown metadata values are non-fatal"

"$TMPDIR/gurt" commands --all --json | jq -e '.commands[] | select(.route == "gurt partial meta test" and .summary == "Partial metadata keeps inferred route")' >/dev/null
pass "partial metadata keeps inferred fallback route"

"$TMPDIR/gurt" commands --all --json | jq -e '.commands[] | select(.route == "gurt body metadata test" and .summary == "Run the body metadata test command")' >/dev/null
pass "metadata-looking comments after script body are ignored"

output=$("$TMPDIR/gurt" weird test)
assert_output_contains "temporary metadata command dispatches" "$output" "weird-ok"

output=$("$TMPDIR/gurt" partial meta test)
assert_output_contains "partial metadata command dispatches" "$output" "partial-ok"

output=$("$TMPDIR/gurt" body metadata test)
assert_output_contains "body metadata command dispatches by filename" "$output" "body-metadata-ok"
