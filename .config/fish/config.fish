set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"
set VISUAL "zathura"


set fish_color_normal white
set fish_color_autosuggestion blue
set fish_color_command brcyan
set fish_color_error brred
set fish_color_param brcyan


alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias brave="brave --use-gl=desktop --enable-features=VaapiVideoDecoder --disable-features=UseChromeOSDirectVideoDecoder"

alias fm='fm6000 -r -c=random'
alias cr='colorscript random'
#macchina 
#fm6000 -r -c=random
set x (random choice cr macchina starfetch)
$x
starship init fish | source
