if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval $(ssh-agent) > /dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -q ~/.ssh/id_rsa > /dev/null
ssh-add -q ~/.ssh/id_serveur > /dev/null
ssh-add -q ~/.ssh/etienne_pc > /dev/null

# For cron jobs
export EDITOR=vim

export NNN_BMS='r:~/repos;w:~/Pictures/Backgrounds;d:/mnt/data/'
export NNN_SCRIPT='/home/etienne/.scripts/nnn'

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
#fi
