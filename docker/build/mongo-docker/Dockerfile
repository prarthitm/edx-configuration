FROM edxops/common:v2
MAINTAINER e0d

USER docker
#WORKDIR /edx/app/edx_ansible
#ENV PATH /bin:/sbin:/usr/sbin:/usr/bin
ADD inventory /etc/ansible/hosts
WORKDIR /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
RUN sudo git fetch --all
RUN sudo git checkout e0d/docker-latest
RUN sudo git pull
RUN sudo ansible-playbook mongo.yml -c local
USER root
RUN echo "bust cache"
CMD ["mongod", "--smallfiles", "--config", "/etc/mongod.conf"]
EXPOSE 27017 27018 27019 
