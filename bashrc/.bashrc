#
# ~/.bashrc
#

# If not running interactively, don't do anything

eval "$(oh-my-posh init bash --config /home/doruk/.dotfiles/posh-themes/themes/kushal.omp.json)"
fortune -s| cowsay -f tux

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

#Folder Aliases
alias root='cd /'
alias home='cd ~'
alias vim='nvim'
alias ocf='cd ~/OddCodeFolder && nvim'
alias config='cd ~/.config && vim'
alias fep="cd FrontEndProjects"
alias dotfiles="cd ~/.dotfiles"
alias ci="cd ~/coding-interviews && ls"
alias notes="cd ~/Notes && ls"
alias osf="cd ~/open-source-friday"



#One Char Aliases
alias c='clear'
alias h='Hyprland'
alias n='neofetch'
alias s="source ~/.bashrc"

#Execute Shortcut Aliases
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias sfml="-lsfml-graphics -lsfml-window -lsfml-system"
alias glfw="glad.c -lglfw -lGL -lm -lX11 -lpthread -lXi -lXrandr -ldl"
alias cpp="g++ -o"

#Github Aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpull="git pull"
alias gd="git diff"

#SSH Agent Initialize


PS1='[\u@\h \W]\$ '

#alias obsidian="cd ~/Obsidian/Obsidian-Notes"
