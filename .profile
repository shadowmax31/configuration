if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval $(ssh-agent) > /dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -q ~/.ssh/id_rsa > /dev/null
ssh-add -q ~/.ssh/id_serveur > /dev/null
ssh-add -q ~/.ssh/etienne_pc > /dev/null
ssh-add -q ~/.ssh/id_rock_prod > /dev/null

# For cron jobs
export EDITOR=vim

export NNN_BMS='r:~/repos;w:~/Pictures/Backgrounds;d:/mnt/DATA/'

MPD_HOST=${HOME}/.mpd/socket;
export MPD_HOST

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
#fi
