# Set identification from install inputs
if [[ -n ${GURT_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$GURT_USER_NAME"
fi

if [[ -n ${GURT_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$GURT_USER_EMAIL"
fi
