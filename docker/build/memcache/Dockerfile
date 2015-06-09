FROM edxops/precicse-common:v1
MAINTAINER e0d

USER docker
WORKDIR /edx/app/edx_ansible
ENV PATH /tmp/ansible/bin:/bin:/sbin:/usr/sbin:/usr/bin
#ENV ANSIBLE_LIBRARY /edx/app/edx_ansible/edx_ansible/playbooks/library
#ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
ADD inventory /etc/ansible/hosts
WORKDIR /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
RUN sudo git fetch --all
RUN sudo git checkout e0d/es-play
RUN sudo git pull
RUN sudo ansible-playbook elasticsearch.yml -c local
USER root
WORKDIR /etc/elasticsearch
CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
EXPOSE 9200 9300
