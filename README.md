# Git Filters

You can run scripts in Git for performing actions for outgoing and incoming
content in commits.

## Function script

The actual script which executes on filter actions.

The script must read and write through stdin and stdout.

.gitfilter/removekeys.sh

```bash
#!/bin/bash

# Double quotes for variables.
sed "s+$SECRETKEY+******+g"
```

.gitfilter/addkeys.sh

```bash
#!/bin/bash

# Double quotes for variables.
sed "s+\*\*\*\*\*\*+$SECRETKEY+g"
```

Make sure files are executable:

```bash
chmod +x .gitfilter/*
```

Name your variable such as:

```bash
export SECRETKEY='password'
```

Test script:

```bash
echo "some text and password" | .gitfilter/removekeys.sh
echo "some text and ******" | .gitfilter/addkeys.sh
```

## .gitattributes

Create a file at repo root called `.gitattributes`.

Given types of files, you can apply a filter. We will give the filter name `removekeys`.

```bash
*.json filter=secretkeys
*.txt  filter=secretkeys
```

## Add filter to config

Link scripts to the filter. There is only one filter but with two attributes for
each filter. One for outgoing and another for incoming.

```bash
git config filter.secretkeys.clean ".gitfilter/removekeys.sh"
git config filter.secretkeys.smudge ".gitfilter/addkeys.sh"
```

Clean and Smudge are Git keywords. These will define the behavior of the filter.

### Clean

Clean is run when you stage or commit a file.
Typical use: encrypt, compress, normalize line endings, strip debug info, etc.

### Smudge

Smudge is run when you check out or view a file.
Typical use: decrypt, decompress, add metadata back in, etc.
