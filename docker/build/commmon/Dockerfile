FROM edxops/precise_basis:v2
MAINTAINER e0d

USER docker
#WORKDIR /edx/app/edx_ansible
#ENV PATH /tmp/ansible/bin:/bin:/sbin:/usr/sbin:/usr/bin
ADD inventory /etc/ansible/hosts
WORKDIR /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
RUN sudo git fetch --all
RUN sudo git checkout e0d/docker-latest
RUN sudo ansible-playbook common.yml -c local
