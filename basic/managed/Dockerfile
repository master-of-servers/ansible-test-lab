FROM ubuntu:18.04

COPY files/id_rsa /root/.ssh/id_rsa
COPY files/id_rsa.pub /root/.ssh/id_rsa.pub
COPY files/authorized_keys /root/.ssh/authorized_keys

RUN apt-get update && \
  apt-get install -y iproute2 ssh sudo vim wget && \
  mkdir -p /root/.ansible && \
  sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM\syes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  service ssh start && \
  eval "$(ssh-agent)" && \
  ssh-add /root/.ssh/id_rsa && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 22
CMD bash; /usr/sbin/sshd -D
