#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "› brew update"
brew update
echo "› brew bundle"
brew bundle --file=$DIR/Brewfile
