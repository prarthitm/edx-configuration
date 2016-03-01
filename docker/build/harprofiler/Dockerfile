# To build this Dockerfile:
#
# From the root of configuration:
#
# docker build -f docker/build/harprofiler/Dockerfile .
#
# This allows the dockerfile to update /edx/app/edx_ansible/edx_ansible
# with the currently checked-out configuration repo.

FROM edxops/trusty-common:latest
MAINTAINER edxops

ARG HARPROFILER_VERSION=master
ARG REPO_OWNER=edx

ADD . /edx/app/edx_ansible/edx_ansible

WORKDIR /edx/app/edx_ansible/edx_ansible/docker/plays

COPY docker/build/harprofiler/ansible_overrides.yml /
RUN sudo /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook harprofiler.yml \
    -c local -i '127.0.0.1,' \
    -t 'install' \
    --extra-vars="@/ansible_overrides.yml" \
    --extra-vars="HARPROFILER_VERSION=$HARPROFILER_VERSION" \
    --extra-vars="COMMON_GIT_PATH=$REPO_OWNER"

COPY docker/build/harprofiler/ansible_overrides.yml /
RUN sudo /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook harprofiler.yml \
    -c local -i '127.0.0.1,' \
    -t 'test:unit' \
    --extra-vars="@/ansible_overrides.yml" \
    --extra-vars="HARPROFILER_VERSION=$HARPROFILER_VERSION" \
    --extra-vars="COMMON_GIT_PATH=$REPO_OWNER"

USER root

ENTRYPOINT ["/edx/app/harprofiler/venvs/harprofiler/bin/python", "/edx/app/harprofiler/harprofiler/harprofiler.py"]
CMD ["--help"]
