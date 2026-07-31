ghelp() {
  cat <<'EOF'
=== GIT Helper ===

This helper function assume you are in the root of directory of your git repository
To install copy all of this line to your existing ~/.bashrc and execute source ~/.bashrc

[gnew]    gnew ticket_number
          → Convinient way of updating local branch and creating a new branch out of main with formatted branch name"

[gpush]   gpush -n "your commit new message" || gpush -a "your commit ammend message"
	  → Convinient way of staging,commiting,rebasing and pushing your code to github repository (www.github.com/avaloq)

[ga]      git add 
          → Stage specific files for commit.

[gs]      git status -sb
          → Short status of working directory and staged files.

Tip: Run 'ghelp' anytime to see this menu.
=======================
EOF
}

gpush() {
  if [ $# -lt 2 ]; then
    echo "Usage: gpush -n \"Commit message\""
    echo "       gpush -a \"Commit message\""
    return 1
  fi

  # Detect current branch
  branch=$(git rev-parse --abbrev-ref HEAD)

  case "$1" in
    -n)
      echo "Terraform formatting & Staging files"
      terraform fmt  
      git add .
      echo "Rebasing & commit with message"
      gcommit $2
      git pull --rebase origin main
      echo "Setting upstream and push"
      git push --set-upstream origin "$branch"
      git push
      ;;
    -a)
      echo "Terraform formatting & Staging files"
      terraform fmt      
      git add .
      echo "Rebasing & ammending commit message"
      gamend $2
      echo "Push"
      git pull --rebase origin main
      git push --force
      ;;
    *)
      echo "Invalid option. Use -n for new commit or -a for amend."
      return 1
      ;;
  esac
}

gamend() {
  if [ -z "$1" ]; then
    echo "Usage: gamend \"Commit message\""
    return 1
  fi

  # Detect current branch
  branch=$(git rev-parse --abbrev-ref HEAD)

  # Strip feat/ prefix if present
  ticket=$(echo "$branch" | sed 's/^feat\///')

  # Amend commit with normalized format
  git commit --amend -m "feat: ${ticket} - $2"
}

gcommit() {
  if [ -z "$1" ]; then
    echo "Usage: gcommit \"Commit message\""
    return 1
  fi

  # Detect current branch
  branch=$(git rev-parse --abbrev-ref HEAD)

  # Strip feat/ prefix if present
  ticket=$(echo "$branch" | sed 's/^feat\///')

  # Commit with normalized format
  git commit -m "feat: ${ticket} - $2"
}

gnew() {
  if [ -z "$1" ]; then
    echo "Usage: gnew ticket_number"
    return 1
  fi

  # Checkout main and pull latest
  git checkout main && git pull origin main

  # Create new branch from updated main
  git checkout -b "feat/HELP-$1"
}

# Status & logs
alias grv='git remote -v'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --pretty=format:"%h %ad | %s%d [%an]" --date=short'

# Branching
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
# Commits
alias gc='git commit -m'
alias gca='git commit -a -v'
alias gcam='git commit -am'
alias gcame='git commit --amend -m'

# Staging
alias ga='git add'

# Pull/Push
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull --rebase origin main'

# PR workflows
alias gpr='git fetch origin pull/$1/head:pr-$1 && git checkout pr-$1'
alias gprc='git checkout pr-$1'

# Cleanup
alias gclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gprune='git remote prune origin'

# Diff & blame
alias gd='git diff'
alias gds='git diff --staged'
alias gbm='git blame -c'


