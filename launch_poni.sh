#!/bin/sh

docker run -it --rm \
  --gpus all \
  --privileged \
  --network host \
  --ipc host \
  --env NVIDIA_VISIBLE_DEVICES=1 \
  --env NVIDIA_DRIVER_CAPABILITIES=all \
  --env DISPLAY=${DISPLAY} \
  --env XAUTHORITY=/root/.Xauthority \
  --env QT_X11_NO_MITSHM=1 \
  --env CUDA_VISIBLE_DEVICES=0 \
  --env CUDA_LAUNCH_BLOCKING=1 \
  --env LD_LIBRARY_PATH=/opt/hpcx/ompi/lib:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH \
  --env WANDB_API_KEY=a05ecea339d73ab9557a2f973e4c79b01afc7b7a \
  --volume "$(pwd):/ws/external/" \
  --volume "/media/TrainDataset:/ws/data" \
  --volume "/media/TrainDataset/objectnav_data/data:/ws/external/data" \
  --volume "/home/dnwn24/.cache/:/home/user/.cache/" \
  --volume "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume "/etc/group:/etc/group:ro" \
  --volume "$HOME/.Xauthority:/root/.Xauthority:rw" \
  --cap-add=SYS_PTRACE \
  --group-add=audio \
  --group-add=video \
  --shm-size=12gb \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --workdir /ws/external \
  dnwn24/poni:gui_v1 /bin/bash
