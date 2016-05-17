#!/bin/bash

set -e

DEPLOY_BRANCH="gh-pages"

BOLD=`tput bold`
RESET=`tput sgr0`

log () {
    echo "$@"
}

msg () {
    log "$BOLD$@$RESET"
}

if [ "$TRAVIS_BRANCH" != "master" ]; then
    msg "not on master, skipping documentation build"
    exit 0
fi

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    msg "building a pull request, skipping documentation build"
    exit 0
fi

msg "Now building documentation"

if [ -z "$BASEURL" ]; then
    if [ -z "$CNAME" ]; then
        BASEURL="http://${TRAVIS_REPO_SLUG%/*}.github.io/${TRAVIS_REPO_SLUG##*/}/"
    else
        BASEURL="http://$CNAME/"
    fi
fi

log "baseurl set to $BOLD$BASEURL$RESET"

# clear output directory (usefull for local testing)
rm -rf "$TRAVIS_BUILD_DIR/notes/public"

(cd "$TRAVIS_BUILD_DIR/notes" && hugo --baseURL="$BASEURL")

if [ -n "$CNAME" ]; then
    log "configuring CNAME $BOLD$CNAME$RESET"
    echo "$CNAME" > "$TRAVIS_BUILD_DIR/notes/public/CNAME"
fi

if [ -z "$GITHUB_TOKEN" ]; then
    log "no \$GITHUB_TOKEN, assuming deploy key is available"
    REPO_URL="git@github.com:$TRAVIS_REPO_SLUG.git"
else
    REPO_URL="https://github.com/$TRAVIS_REPO_SLUG.git"
    echo -e "machine github.com\n  login $GITHUB_TOKEN" >> "$HOME/.netrc"
fi

log "going to deploy to $BOLD$REPO_URL$RESET"

cd $TRAVIS_BUILD_DIR

# quiet do suppress diff
AUTHOR_EMAIL="`git --no-pager show --quiet --format="%aE" HEAD`"

cd $TRAVIS_BUILD_DIR/notes/public

git init
git remote add deploy "$REPO_URL"
git fetch deploy "$DEPLOY_BRANCH" || true
git symbolic-ref HEAD "refs/remotes/deploy/$DEPLOY_BRANCH"
git add -A
git config user.name "Travis CI"
git config user.email "$AUTHOR_EMAIL"
git diff-index --quiet HEAD || git commit -m 'Updating Documentation'
git checkout -b "$DEPLOY_BRANCH"
git push deploy "$DEPLOY_BRANCH"
