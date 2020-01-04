if [ ! -e ~/.ssh/id_rsa.pub ]; then
  echo
  echo 'Creating your public and private ssh keys'
  echo '----------------------------------------'

  # Create public and private 2048 bit ssh key pair without pw prompt
  ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ''
  echo

  # Copy new key to make it possible to autologin
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod 0600 ~/.ssh/authorized_keys

  # Add the ssh key
  eval "$(ssh-agent)"
  ssh-add ~/.ssh/id_rsa
else
  echo
  echo "Public ssh key file already exists"
  echo "----------------------------------------"
fi
