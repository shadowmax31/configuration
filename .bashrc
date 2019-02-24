if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

alias s="ssh root@serveur.bck"
alias fn="ssh -L 8888:localhost:8888 -L 8080:localhost:8080 root@free.v"
alias work="sudo rdesktop -g 95% 192.168.20.154 -a 32"
alias r="/home/etienne/refresh_ip"

# Pour pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

neofetch
fish
