FROM ubuntu:18.04

ENV ANSIBLE_VAULT_PASSWORD_FILE=/root/.ansible/.vault_pass.txt

COPY files/id_rsa /root/.ssh/id_rsa
COPY files/id_rsa.pub /root/.ssh/id_rsa.pub
COPY files/authorized_keys /root/.ssh/authorized_keys
COPY files/ansible/ansible /root/.ansible

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:ansible/ansible -y && \
  apt-get update && \
  apt-get install -y ansible iproute2 ssh vim wget && \
  sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM\syes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  service ssh start && \
  eval "$(ssh-agent)" && \
  ssh-add /root/.ssh/id_rsa && \
  # Create vault credential
  echo "p@ssw0rd!" > /root/.ansible/.vault_pass.txt && \
  ansible-vault encrypt /root/.ansible/group_vars/vault && \
  # Move roles to /etc/ansible
  mv /root/.ansible/roles/* /etc/ansible/roles/ && \
  rm -rf /root/.ansible/roles && \
  rm -rf /var/lib/apt/lists/*

COPY files/ansible/ansible.cfg /etc/ansible/ansible.cfg 
COPY files/ansible/hosts /etc/ansible/hosts

CMD bash; /usr/sbin/sshd -D
