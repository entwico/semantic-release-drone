#!/bin/sh

export MODE=$PLUGIN_MODE

export GIT_AUTHOR_NAME=$PLUGIN_GIT_USER_NAME
export GIT_AUTHOR_EMAIL=$PLUGIN_GIT_USER_EMAIL
export GIT_COMMITTER_NAME=$PLUGIN_GIT_USER_NAME
export GIT_COMMITTER_EMAIL=$PLUGIN_GIT_USER_EMAIL

export GH_TOKEN=$PLUGIN_GITHUB_TOKEN
export GL_TOKEN=$PLUGIN_GITLAB_TOKEN
export BB_TOKEN=$PLUGIN_BITBUCKET_TOKEN
export GIT_CREDENTIALS=$(node /semantic-release/create-credentials.js)

cp /semantic-release/.releaserc.json .releaserc

if [ "$MODE" = "predict" ]; then
  semantic-release -d | sed -E 's/.*([0-9]+.[0-9]+.[0-9]+)/\1/' > .release-version
else
  semantic-release
fi

rm .releaserc

FILE=.release-version

if [ -f "$FILE" ]; then
  VERSION_NUMBER=$(cat $FILE)

  if [ -n "$VERSION_NUMBER" ]; then
    if [ -n "$PLUGIN_VERSION_FILE" ]; then mv .release-version $PLUGIN_VERSION_FILE; fi
  else
    echo "There is no new version found (file is empty), skipping release..."
    exit 1
  fi
else
  echo "There is no new version found (no release file generated), skipping release..."
  exit 1
fi
