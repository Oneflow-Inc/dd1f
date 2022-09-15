set -ex
docker run --rm -it \
    -v $(echo ~)/disco-diffusion/images_out:/workspace/code/images_out \
    -v $(echo ~)/disco-diffusion/init_images:/workspace/code/init_images \
    --gpus=all \
    --name dd-${USER} \
    --name="disco-diffusion" --ipc=host \
    --user $(id -u):$(id -g) \
oneflowinc/dd1f:latest python disco-diffusion/disco.py
