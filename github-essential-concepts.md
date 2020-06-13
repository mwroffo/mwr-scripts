HEAD is a pointer that is always an alias to the last commit on any branch.
git log --oneline # list commits with one-line commit messages.

make gitignore ignore changed to a tracked file:
    add the file to .gitignore
    `git rm --cached some-file.txt`

retrieve old version of a file into staging index 
    git checkout a4c4Fd -- file.txt
or  git revert a4c4Fd # retrieve entire old commit into staging index

remove untracked files from working directory (staged files, by contrast, are safe from `git clean -f`)
    `git clean -f`

amend a previous commit to include new changes in addition to whatever changes were already in the commit.
    `git commit --amend -m "forgot something"`

throw out changes in working directory:
    re-checkout index.html from the repo tree of the current branch, in order to . -- is alias to current branch?
    git checkout -- index.html

unstage from staging index:
    reset a file to the way it was on the last commit on any branch
    `git reset HEAD <file.txt>`

git show a2bk4af --color-words # show in color a diff of this commit and its parent
git show a3facf..a778ddf --color-words # show in color diff of these two specific commits
git diff # view difference between lastest commits on staging index and working directory respectively
git diff --staged (alias: --cached) # view difference between repo tree and staging index
git rm file.txt # do `rm file.txt` then add deletion to staging index
git mv first-file.txt primary-file.txt # do `mv first-file.txt primary-file.txt` then add rename to staging index