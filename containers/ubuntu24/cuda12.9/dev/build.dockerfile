FROM nvidia/cuda:12.9.1-cudnn-devel-ubuntu24.04

ARG HOST_USER=wiennan
ARG HOST_UID=1000
ARG HOST_GID=1000
ARG USER_REPOS_PATH=/home/${HOST_USER}/workspace/repos
ARG USER_LIB_PATH=/home/${HOST_USER}/workspace/libs

USER root

ENV USER_REPOS_PATH=${USER_REPOS_PATH}
ENV USER_LIB_PATH=${USER_LIB_PATH}

RUN --mount=type=bind,from=boot_repos,target=/tmp/boot_repos \
    bash /tmp/boot_repos/containers/tools/setup_aliyun_apt_src.sh && \
    bash /tmp/boot_repos/containers/ubuntu24/scripts/install_basic_deps.sh && \
    bash /tmp/boot_repos/containers/tools/setup_user.sh
