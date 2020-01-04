# Create public and private 2048 bit ssh key
ssh-keygen -t rsa -b 2048 -f ./files/id_rsa -N ''

cat ./files/id_rsa.pub >> ./files/authorized_keys
chmod 0600 ./files/authorized_keys
