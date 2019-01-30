if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval $(ssh-agent) > /dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -q ~/.ssh/id_rsa > /dev/null
ssh-add -q ~/.ssh/id_serveur > /dev/null

wal -R
