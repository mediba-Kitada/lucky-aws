FROM tianon/centos:6.5

RUN yum -y install openssh-server
RUN useradd -m mediu
RUN mkdir -p /home/mediu/.ssh; chown mediu /home/mediu/.ssh; chmod 700 /home/mediu/.ssh
ADD ./authorized_keys /home/mediu/.ssh/authorized_keys
RUN chown mediu /home/mediu/.ssh/authorized_keys; chmod 600 /home/mediu/.ssh/authorized_keys
CMD ["/usr/sbin/sshd","-D"]