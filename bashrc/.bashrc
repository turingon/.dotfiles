#
# ~/.bashrc
#

# If not running interactively, don't do anything

# eval "$(oh-my-posh init bash --config ~/.dotfiles/posh-themes/theme.omp.json)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
fortune -s | cowsay -f tux

[[ $- != *i* ]] && return
# kitty ssh fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh" 


alias ls='ls --color=auto'
alias grep='grep --color=auto'

#Folder Aliases
alias root='cd /'
alias home='cd ~'
alias vim='nvim'
alias vi='nvim'
alias dotfiles="cd ~/.dotfiles"
alias myserver="ssh root@103.83.87.37"
alias code="cd ~/Code/"
alias projects="cd ~/Projects/"

#One Char Aliases
alias c='clear'
alias n='neofetch'
alias s="source ~/.bashrc"

#Execute Shortcut Aliases
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias sfml="-lsfml-graphics -lsfml-window -lsfml-system"
alias glfw="glad.c -lglfw -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl"
alias cpp="g++ -o"

#Github Aliases
alias gs="git status"


PS1='[\u@\h \W]\$ '

#alias obsidian="cd ~/Obsidian/Obsidian-Notes"
export TERM=xterm-256color
