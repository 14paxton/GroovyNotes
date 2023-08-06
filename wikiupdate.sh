DIRNAME=$(basename "$(pwd)");
SHORTREPOKEY=$(echo "$DIRNAME" | tr '[:upper:]' '[:lower:]');
access_token='${{ secrets.SYNCTOKEN }}'
wiki_folder='${{ github.event.repository.name }}'

# make folder and file so wiki is autoupdated
[[ ! -d "./.github/workflows/ " ]] && mkdir -p ./.github/workflows/

cat << EOL >  ./.github/workflows/updatewiki.yml
---
on:
  push:
    branches:
      - "master"
  pull_request:
    branches:
      - "master"
name: Update Wiki
jobs:
  udpate-wiki:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Wiki Sync
        uses: LillyWho/ghaction-wiki-sync-custom@v1.0
        with:
          username: 14paxton
          access_token: $access_token
          wiki_folder: $wiki_folder
          commit_message: "wikisync"
          commit_username: "14paxton"
          commit_email:    "26972590+14paxton@users.noreply.github.com "
EOL

# make folder for wiki to update from and move markdown files to new folder
[[ -d ./wiki/ ]] && mv wiki "$DIRNAME"
[[ ! -d ./"$DIRNAME" ]] && mkdir -p "$DIRNAME"

if [[ -n *.md(#qN) ]]; then
  mv *.md ./"$DIRNAME"/
fi

cd "$DIRNAME"

# create frontmatter index file for side nav to key on
[[ -d ./$DIRNAME/ ]] && cd "$DIRNAME"
#[[ ! -f ./$DIRNAME ]] &&  touch "$DIRNAME".md
cat << EOL >  "$DIRNAME".md
---
title: $DIRNAME
layout: default
permalink: $DIRNAME/
category: $DIRNAME
has_children: true
share: true
shortRepo:

  - $SHORTREPOKEY
  - default
---

# [REPO](https://github.com/14paxton/$DIRNAME)
EOL

# get files and add frontmatter for side nav tree
for st in $(find "$(PWD)" -type f); do
FILENAME=${$(basename "$st")%.*}
PERMALINK=$DIRNAME/$FILENAME
if [[ "$FILENAME" != "$DIRNAME" && ! $(grep -R "has_children" "$FILENAME".md) ]] then;

ex "$st" << eof
1 insert
---
title: $FILENAME
permalink: $PERMALINK
category:  $DIRNAME
parent:   $DIRNAME
layout: default
has_children: false
share: true
shortRepo:
  - $SHORTREPOKEY
  - default
---


<br/>

<details markdown="block">
<summary>
Table of contents
</summary>
{: .text-delta }
1. TOC
{:toc}
</details>

<br/>

***

<br/>

.
xit
eof
fi
done;