GURT_MIGRATIONS_STATE_PATH=~/.local/state/gurt/migrations
mkdir -p $GURT_MIGRATIONS_STATE_PATH

for file in ~/.local/share/gurt/migrations/*.sh; do
  touch "$GURT_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
