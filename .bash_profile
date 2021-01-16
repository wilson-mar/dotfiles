# File: ~/.bash_profile by WilsonMar@gmail.com
NOW=$(date +"%a %Y-%m-%d %r %z %Z")
echo "In $BASH_SOURCE $NOW" # e.g. Fri 2020-03-20 10:59:52 PM -0600 MDT
    # EUID $EUID # requires password.
# See http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR="1"
export LSCOLORS="GxFxCxDxBxegedabagaced" #  for Dark Terminal themes  https://geoff.greer.fm/lscolors/
# export LSCOLORS="eafxcxdxbxegedabagacad" #  for White Terminal themes
   # See it work with ls -GFh
export GREP_OPTIONS="--color=auto"  # Tell grep to highlight matches.
# ./configure --prefix=/usr/local/guile-2.2.4 

export PATH="/usr/local/bin:/usr/local:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin" # base, last to see
                                              # /bin/bash,echo,cat,kill,sleep,jupyter
                                     # /usr/bin/which,sed,vim,ruby,yes
           # /usr/local/bin/brew,etc.
## Colons separate folders in PATH:
export PATH="/usr/bin/python:/usr/local/Caskroom/:$PATH"  # /usr/local/Caskroom/ for conda within anaconda
export PATH="/usr/local/anaconda3/bin/:$PATH"  # /usr/local/Caskroom/ for conda within anaconda
export PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/php/ext/:$PATH"  # for gd
export PATH="/usr/local/opt/openjdk/bin:$PATH"

npm config set prefix '~/.npm-global'  # or NPM_CONFIG_PREFIX=~/.npm-global
export PATH="~/.npm-global/bin:$PATH"

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# For compilers to find python@3.8 installed by brew install az-cli
export CPPFLAGS="-I/usr/local/opt/ruby/include -I/usr/local/opt/openjdk/include"
export LDFLAGS="-L/usr/local/opt/ruby/lib -L/usr/local/opt/python@3.8/lib"  
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"  # For pkg-config to find python@3.8

function parse_git_branch() {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(gd)/"
	  # git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/"
   }
# The above enables:
#export PS1="\n  \w\[\033[33m\] \$(parse_git_branch)\[\033[00m\]\n$ "
           # \n puts cursor on a separate line 
           #     \w\ is like $PWD:
export PS1="\n  \w\[\033[33m\]\n$ "

# For Git siging:  GPG_TTY=/dev/ttys001"
export GPG_TTY=$(tty)

# Per https://wilsonmar.github.io/maximum-limits/
sudo launchctl limit maxfiles 65536 200000

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"

export NEO4J_HOME="/usr/local/Cellar/neo4j/3.5.12/libexec/"
export NEO4J_VER="3.5"

export GOROOT='/usr/local/opt/go/libexec'
export PATH=$PATH:$GOROsOT/bin
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export GOHOME="$HOME/gmail_acct/golang-samples"
#export GOHOME='$HOME/golang1'
#go get golang.org/x/tools/cmd/godoc
#go get golang.org/x/tools/cmd/vet

#export VAULT_VERSION="1.3.4"   # from brew install vault
#complete -C /usr/local/bin/vault vault
#export VAULT_ADDR=https://vault.prod.init.ak8s.mckinsey.com

#brew upgrade google-chrome  # takes too long.

# Load Ruby Version Manager into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

eval "$(pyenv virtualenv-init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/anaconda3/etc/profile.d/conda.sh" ]; then
        . "~/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# See https://itdocs.intranet.mckinsey.com/display/OFG/Establish+SSH+Key+Rotation
#export VAULT_ADDR=https://ca-vault-npn.mckinsey.cloud:8200
#vault login -method=okta username=Wilson_Mar@mckinsey.com
#vault write -field=signed_key github/McK-Internal/sign/wilson-mar public_key=@$HOME/.ssh/id_rsa.pub > $HOME/.ssh/id_rsa-cert.pub

source ~/.bashrc   # execute for vault bash completion

export wmo="$HOME/gmail_acct/wilsonmar.github.io/_posts"
source "$HOME/gmail_acct/git-utilities/aliases.sh"
source "$HOME/gmail_acct/git-utilities/alias-functions.sh"
catn $HOME/gmail_acct/git-utilities/aliases.sh  # display aliases on Terminal

# Set it so ~/.pyenv provides Python before others of the same name:
export PYENV_ROOT=$(pyenv root)
export PATH="$PYENV_ROOT/shims:$PATH"  # put pyenv Python shims first 
#export PATH="/usr/local/opt/python@3.8/bin:$PATH"  # installed by Azure
