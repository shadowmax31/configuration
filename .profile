if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval $(ssh-agent) > /dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -q ~/.ssh/id_rsa > /dev/null
ssh-add -q ~/.ssh/id_serveur > /dev/null

export NNN_BMS='r:~/repos;w:~/Pictures/Backgrounds'
export NNN_SCRIPT='/home/etienne/.scripts/background-change.sh'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
