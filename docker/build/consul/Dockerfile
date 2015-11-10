FROM edxops/precise-common:v2
MAINTAINER edxops

USER docker

RUN sudo apt-get update

WORKDIR /edx/app/edx_ansible/edx_ansible/docker/plays

RUN sudo ansible-playbook consul.yml -c local -t 'install:base,install:configuration' 

USER root 
#CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "-n", "--configuration", "/edx/app/supervisor/supervisord.conf"]

#CMD ["./consul agent -data-dir /tmp/consul -config-dir ./consul-config -client 172.19.0.6 -join edx_node1_1.edx"]
EXPOSE 18080
