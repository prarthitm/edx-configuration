FROM edxops/common:v2
MAINTAINER edxops

USER docker
RUN sudo git fetch --all
RUN sudo git checkout e0d/docker-latest
RUN sudo git pull
WORKDIR /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
RUN sudo ansible-playbook forum-docker.yml -c local
USER root 
CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "-n", "--configuration", "/edx/app/supervisor/supervisord.conf"]
#ENTRYPOINT ["/bin/bash"]
EXPOSE 18080
