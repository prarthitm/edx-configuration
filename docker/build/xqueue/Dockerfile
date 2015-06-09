FROM edxops/precise-common:v2
MAINTAINER edxops

USER docker

WORKDIR /edx/app/edx_ansible/edx_ansible
RUN sudo git fetch --all
RUN sudo git checkout e0d/docker-latest
RUN sudo git reset --hard origin/e0d/docker-latest
RUN sudo git pull

WORKDIR /edx/app/edx_ansible/edx_ansible/docker/plays
RUN sudo ansible-playbook xqueue.yml -c local
USER root 
CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "--nodaemon", "--configuration", "/edx/app/supervisor/supervisord.conf"]
#ENTRYPOINT ["/bin/bash"]
EXPOSE 18040 8040
