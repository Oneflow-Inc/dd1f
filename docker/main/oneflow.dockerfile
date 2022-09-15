# We don't need prep phase because it is cached by docker hub
FROM nvcr.io/nvidia/pytorch:21.08-py3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install a few dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install -y tzdata imagemagick

# Create a disco user
RUN useradd -ms /bin/bash disco
USER disco

# Set up code directory
RUN mkdir code
WORKDIR /workspace/code

# Copy over models used
RUN wget --no-directories --progress=bar:force:noscroll -P /home/disco/.cache/clip/ https://openaipublic.azureedge.net/clip/models/afeb0e10f9e5a86da6080e35cf09123aca3b358a0c3e3b6c78a7b63bc04b6762/RN50.pt
RUN wget --no-directories --progress=bar:force:noscroll -P /home/disco/.cache/clip https://openaipublic.azureedge.net/clip/models/40d365715913c9da98579312b702a82c18be219cc2a73407c4526f58eba950af/ViT-B-32.pt
RUN wget --no-directories --progress=bar:force:noscroll -P /home/disco/.cache/clip https://openaipublic.azureedge.net/clip/models/5806e77cd80f8b59890b7e101eabd078d9fb84e6937f9e85e4ecb61988df416f/ViT-B-16.pt
RUN wget --no-directories --progress=bar:force:noscroll -P /workspace/code/models https://the-eye.eu/public/AI/models/512x512_diffusion_unconditional_ImageNet/512x512_diffusion_uncond_finetune_008100.pt
RUN wget --no-directories --progress=bar:force:noscroll -P /workspace/code/models https://the-eye.eu/public/AI/models/v-diffusion/secondary_model_imagenet_2.pth

# Clone Git repositories
RUN git clone https://github.com/alembics/disco-diffusion.git && \
    git clone https://github.com/openai/CLIP && \
    git clone https://github.com/assafshocher/ResizeRight.git && \
    git clone https://github.com/MSFTserver/pytorch3d-lite.git && \
    git clone https://github.com/isl-org/MiDaS.git && \
    git clone https://github.com/mlfoundations/open_clip.git && \
    git clone https://github.com/kostarion/guided-diffusion.git && \
    git clone https://github.com/shariqfarooq123/AdaBins.git

# Install Python packages
RUN pip install imageio imageio-ffmpeg==0.4.4 pyspng==0.1.0 lpips datetime timm ipywidgets omegaconf>=2.0.0 pytorch-lightning>=1.0.8 torch-fidelity einops wandb pandas ftfy opencv-python regex clip matplotlib
