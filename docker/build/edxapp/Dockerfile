FROM edxops/common:v2
MAINTAINER edxops

USER docker
RUN sudo git fetch --all
RUN sudo git checkout e0d/docker-latest
RUN sudo git reset --hard origin/e0d/docker-latest
RUN sudo git pull
WORKDIR /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
RUN sudo ansible-playbook edxapp-docker.yml -c local -e "EDXAPP_PYTHON_SANDBOX=false"
USER root 
CMD ["/edx/app/supervisor/venvs/supervisor/bin/supervisord", "-n", "--configuration", "/edx/app/supervisor/supervisord.conf"]
EXPOSE 18000 48000 18020 18010 48010 8010 8000 
