if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

alias s="ssh root@serveur.bck"
alias fn="ssh -L 8888:localhost:8888 -L 8080:localhost:8080 root@free.v"
