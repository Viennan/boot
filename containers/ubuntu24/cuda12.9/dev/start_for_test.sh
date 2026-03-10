docker run -it \
    --name test_ubuntu24-cuda12.9-dev \
    --user=${USER} \
    --mount type=bind,source=${HOME}/.ssh,target=/home/${USER}/.ssh \
    --mount type=bind,source=${HOME}/.gitconfig,target=/home/${USER}/.gitconfig \
    --mount type=bind,source=${HOME}/workspace,target=/home/${USER}/workspace \
    --runtime=nvidia \
    --env NVIDIA_VISIBLE_DEVICES=all \
    --env NVIDIA_DRIVER_CAPABILITIES=all \
    ${USER}/ubuntu24/cuda12.9/dev:latest /bin/bash