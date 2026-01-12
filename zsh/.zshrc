# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath=( ~/.zfuncs "${fpath[@]}" )

autoload -Uz compinit compinit -i

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TIME=de_DE.UTF-8

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
unsetopt EXTENDED_HISTORY


#Go
export GOPATH="$HOME/go"
export DENO_INSTALL="/home/shubbush/.deno"
export PATH="$PATH:$GOPATH/bin:$DENO_INSTALL/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH"

# Directory contains tmux-256color terminfo
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"


# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# The next line updates PATH for Yandex Cloud CLI.
if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then source "$HOME/yandex-cloud/path.bash.inc"; fi

# The next line enables shell command completion for yc.
if [ -f "$HOME/yandex-cloud/completion.zsh.inc" ]; then source "$HOME/yandex-cloud/completion.zsh.inc"; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"

# bindkey -v

[ -f  /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f  /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# bindkey '^R' history-incremental-search-backward
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# 

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases

alias dc=cd
alias v=nvim
alias ghpr="gh pr create --fill --draft && gh pr view -w"
export EDITOR=nvim

# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias grep="grep -i"       # -i ignore case

eval "$(starship init zsh)"

notes ()
{
	cd ~/notes
  v
}

[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# nnn config
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# Bazel + fzf	
_fzf_complete_bazel_test() {
  _fzf_complete '-m' "$@" < <(command bazel query \
    "kind('(test|test_suite) rule', //...)" 2> /dev/null)
}

_fzf_complete_bazel() {
  local tokens
  tokens=(${(z)LBUFFER})

  if [ ${#tokens[@]} -ge 3 ] && [ "${tokens[2]}" = "test" ]; then
    _fzf_complete_bazel_test "$@"
  else
    # Might be able to make this better someday, by listing all repositories
    # that have been configured in a WORKSPACE.
    # See https://stackoverflow.com/questions/46229831/ or just run
    #     bazel query //external:all
    # This is the reason why things like @ruby_2_6//:ruby.tar.gz don't show up
    # in the output: they're not a dep of anything in //..., but they are deps
    # of @ruby_2_6//...
    _fzf_complete '-m' "$@" < <(command bazel query --keep_going \
      --noshow_progress \
      "kind('(binary rule)|(generated file)', deps(//...))" 2> /dev/null)
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
