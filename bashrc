export PS1="\u@\h$ "
export CLICOLOR=1
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -lA"
alias latex="latex --output-format=pdf"

# Copies files from the home directory to the external hard drive with the 'Data' drive label
alias ext-backup="rsync -avhr --no-p --delete --exclude='Library/' --exclude='anaconda/' --exclude='miniconda' --exclude='Applications/' --include='.git' --exclude='.*' /Users/cfield/ '/Volumes/Data/Mac OSX Backup/'"

# Copies from from the external hard drive with the 'Data' drive label to the home directory
alias ext-restore="rsync -avhr --no-p --update --include='.git' --exclude='.*' --include='/**/.git' '/Volumes/Data/Mac OSX Backup/' '/Users/cfield/'"
