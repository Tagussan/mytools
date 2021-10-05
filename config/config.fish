set -U fish_user_paths $HOME/mytools/bin $fish_user_paths
set -U MCFLY_FUZZY true
set -U MCFLY_INTERFACE_VIEW BOTTOM
set -U GDK_SCALE 2
set -U DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
mcfly init fish | source
zoxide init fish | source
alias ls=lsd
alias v=nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
