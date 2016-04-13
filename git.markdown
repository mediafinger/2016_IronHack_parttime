# git

Is a version control system (VCS). Unlike some others, it is distributed (DVCS) which means every participant of a project can have a full copy of the repository (the folder with all the files of the project) on his own machine and work independently - until the moment code changes have to be exchanged with other coders.

## git configuration

After installing git, you have to set ip up once. Run `which git` to check if it is installed already. And check with `git --version` if you are running a current version (my is 2.8.0 while writing this).

Run these three commands (with your data) to set up git. There are many more possible options that are all saved in a file called `.gitconfig`

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor "atom --wait"
```

## git speak

* _repository / repo_ - the folder under git control with your codebase.
* _stage_ - a list of files that are ready to be commited.
* _commit_ - one or more changes that have been persisted.
* _branch_ - a collection of commits. Usually the branch `master` contains the main version of you code base, all other branches alternative versions. To develop a new feature usually a new branch is created.
* _merging_ - to merge two branches means to combine their codebases e.g. to bring the changes of a feature branch to the master branch.
* _remote_ - a version of the repository that is not on your local machine.
* _origin_ - usually the version of the repository that is on your machine.

## git commands

A list of the most used git commands. There are many more. Every command can be called with options I have not listed. To get more information about a command run `git help command`. Press `q` to exit the help page ;-)

 * `git init` - initializes a git repository. This is done by creating the hidden folder `.git` in the folder where you called git init.

 * `git status` - check for differences between the git repository and your local code base. The differences between unstaged and staged files is mentioned.

 * `git add filename(s)` - adds the listed files to the stage. The dot "." can be used to add all new or changed files

 * `git rm --cached filename(s)` - removes the listed files from the stage. The files and their content remain unchanged.

 * `git stash save "Name of stash"` - saves the not yet commited code changes and reverts to the state of the last commit.

 * `git stash pop` - retrieves the last stash.

 * `git commit` - opens the editor and waits for a commit message. Describe what your change does (and why) and save and close the file. This should create the commit (and lead you back to the console).

 * `git reset --soft HEAD^` - deletes the last commit, but does not change the code. The code changes of the deleted commit will be on the stage.
 * `git reset --hard HEAD~` - deletes the last commit and the code changes.

 * `git log` - display a list of all commits.

 * `git checkout branchname` - switches from the current branch to branchname.

 * `git checkout -b branchname` - creates the new branch (based on you current branch) and switches to it.

 * `git merge branchname` - merges the given branchname into your current branch.

 * `git rebase branchname` - rebases the changes on top of the other branchnames version. Do NEVER do this to public / shared branches as it rewrites history. Use it only to keep the history of your private branches clean.

 * `git fetch` - fetches the code changes of corresponding branch of the remote repository. Displays information about the changes but does not change your local codebase.

 * `git pull` - like calling git fetch && git merge. Merges the remote changes into your local codebase.

 * `git push` - pushes your local changes to the corresponding remote branch. It is good practice to pull before pushing.

## Commit messages

Some advise to write good and consistent commit messages:

 * **Limit the subject line to 50 characters** - as some tools don't display more
 * **Separate subject line from body with a blank line** - this helps in readability and automization
 * **Use the imperative mood in the subject line** - do not use the past tense
 * **Capitalize the subject line**
 * **Do not end the subject line with a period**
 * **Wrap the body at 72 characters**
 * **Format your content for readability** - feel free to use markdown
 * **Use the body to explain what and why** - not just how

The smaller your commits are, the easier it should be to describe them well with a concise commit message.

## GitHub

GitHub is nowadays the most popular platform to host and collaborate on open source software (OSS). It is based on the git protocol and often used as main remote repository.

It may seem at times that having a central platform defeats the idea of a distributed VCS. But GitHub adds a lot of collaboration and communication functionality around coding. This is its main advantage.

### Cloning

This copies the whole repository from GitHub to you local machine. The GitHub repository is set up as remote repo.

Cloning should usually be the first step when someone invites you to work with them on a project.

### Forking

This copies the whole repository from its GitHub location to your GitHub account.

Forking is usually done when you want to use an OSS repo as the basis for your own code, or to create an alternative version, or if you want to add a feature. In the latter case you can work on your fork and later create a PR in the original repo and ask for your changes to be merged back to it.

### Pull Requests

Pull requests (PRs) might be the single most important feature GitHub offers. Opening a PR invites other coders to review the code, leave comments, suggest changes. When everyone is happy with the suggested changes, the PR can be merged. This is usually be done by another coder that merges the code changes (the branch) into the master branch.

### Adding the SSH key

To not type your GitHub credentials over and over again, you should create an SSH key, add it to the SSH agent and upload it to GitHub. The how is described in this turorial:

<https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/>

## Visualization

### Beautiful sandbox

<https://pcottle.github.io/learnGitBranching/?NODEMO>

This demo has no real functionality but is great to visualize branching, merging and rebasing. Just use git commands like:

* git branch new-name
* git commit
* git checkout master
* git merge
* git rebase

### Advanced git documentation

There are many git tutorials out there, but Atlassian's might be the best looking one. It explain many general git topics and also a few which are special to Bitbucket (a GitHub competitor by Atlassian).

<https://www.atlassian.com/git/tutorials/advanced-overview>

### gitx-dev

This is a free OS X GUI (Graphical User Interface) for git. I want you to learn the git commands on the console! But some things work better in a GUI. I personally use this tool to only to check the history (like a nicer `git log + git diff`) and to handpick changes for commits. gitx allow it to select single lines of changes for commits, which makes it easier to use than `git add` on the command line.

All other git commands I still use on the command line and I hope you will too, to learn them properly!

<https://rowanj.github.io/gitx/>
