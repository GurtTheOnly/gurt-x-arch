# Place in each assistant's global skills directory so the Gurt skill is available on first install
mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$GURT_PATH/default/gurt-skill" ~/.agents/skills/gurt
ln -sfn "$GURT_PATH/default/gurt-skill" ~/.claude/skills/gurt
ln -sfn "$GURT_PATH/default/gurt-skill" ~/.codex/skills/gurt
ln -sfn "$GURT_PATH/default/gurt-skill" ~/.pi/agent/skills/gurt
