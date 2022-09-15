set -e
docker run --rm -it \
    -v $PWD/images_out:/workspace/code/images_out \
    -v $PWD/init_images:/workspace/code/init_images \
    --gpus=all \
    --name="dd-${USER}" --ipc=host \
oneflowinc/dd1f:latest bash -c "python3 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple & bash"
