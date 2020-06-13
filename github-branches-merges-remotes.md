def treeish: a commit, directory, or reference (e.g SHA-1 hash, HEAD, branch or tag reference, ancestry)
refer to a parent commit: HEAD^ or 2d4Fd4^ or HEAD~1, or grandparent: HEAD^^ or HEAD~2, great-grandparent: HEAD^^^ or HEAD~3
    parent of the last commit in the master branch: master^
list the contents of a tree-ish: `git ls-tree <tree-ish>`
    blob: binary large object
    tree: directory
filter git log: 
    get last three commits
        -3
    everything since jan 1 2019
        --after=2019-01-01
    everything before jan 1 2019
        --before=2019-01-01
    everything by me:
        --author="Michael"
    everything since some commit:
        `git log af4Cffab..HEAD`
    only changes concerning file.txt:
        `git log file.txt`
    only commits where the message contains "bug":
        --grep="bug"

show patches (changes) with each commit in the log:
    `git log -p`
show statistics about changes rather than the changes themselves:
    `git log --stat`
show commit tree in a prettified graph:
    `git log --graph --all --oneline --decorate`
show commit tree in other formats:
    `git log --format=<option>`

HEAD: a ref pointing to the last commit on the current branch, like a playhead in your DAW.

create a new branch from the current branch, and switch to it:
    `git checkout -b new-branch`

switching with uncommited changes in working directory:
    if working dir changes create conflict in repo tree, cannot switch.
    else, switching with uncommited working changes is ok.
    or, if the files are not being tracked, you can switch branches.

Q: whats the difference between `git diff branch..branch` and `git show commit..commit`? 
    A: git show assumes the current branch and does diff on its parent (or the incoming branch-tip if you're in a merge conflict)

see what branches are fully merged into current branch (i.e. their tips are in the history of current branch):
    `git branch --merged`
see what branches are not fully merged into current branch:
    `git branch --no-merged`

types of reset:
    --soft
        move HEAD pointer, undoing commits into staging index and not affecting working directory. good for going back in time and recommiting as a single commit.
    --mixed (default)
        undo commits into working directory. good for going back in time and recommiting as two separate commits
    --hard
        permanently undo everything since this commit! good for duplicating one branch as another.

types of merges:
    fast-forward merge: incoming branch merges onto the tip of the receiving branch
    recursive merge: incoming branch merges between two commits in the receiving tree

strategies for reducing conflicts:
    feature --flags: merge the code into master but don't activate it till its ready
    or also: what we call tracking: merge in from master as you go

remote repositories (or simply 'remotes'):
    remote: master
        the master branch on the remote server
    myComputer: origin/master
        a local branch that tries to stay in sync with the master on remote
    myComputer: master
        the local branch where you make your commits
    git fetch
        fetches commits from remote master into origin/master. these must then be `git merge`d.