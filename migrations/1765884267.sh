echo "Change to openai-codex instead of openai-codex-bin"

if gurt-pkg-present openai-codex-bin; then
    gurt-pkg-drop openai-codex-bin
    gurt-pkg-add openai-codex
fi
