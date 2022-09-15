FROM nvcr.io/nvidia/pytorch:21.08-py3 AS prep
    RUN mkdir -p /scratch/models && \
        mkdir -p /scratch/models/superres && \
        mkdir -p /scratch/models/slip && \
        mkdir -p /scratch/model-lpips && \
        mkdir -p /scratch/clip && \
        mkdir -p /scratch/pretrained

# RUN wget --no-directories --progress=bar:force:noscroll -P /scratch/clip/ https://openaipublic.azureedge.net/clip/models/afeb0e10f9e5a86da6080e35cf09123aca3b358a0c3e3b6c78a7b63bc04b6762/RN50.pt

# RUN wget --no-directories --progress=bar:force:noscroll -P /scratch/clip https://openaipublic.azureedge.net/clip/models/40d365715913c9da98579312b702a82c18be219cc2a73407c4526f58eba950af/ViT-B-32.pt

# RUN wget --no-directories --progress=bar:force:noscroll -P /scratch/clip https://openaipublic.azureedge.net/clip/models/5806e77cd80f8b59890b7e101eabd078d9fb84e6937f9e85e4ecb61988df416f/ViT-B-16.pt

# RUN wget --no-directories --progress=bar:force:noscroll -P /scratch/models https://the-eye.eu/public/AI/models/512x512_diffusion_unconditional_ImageNet/512x512_diffusion_uncond_finetune_008100.pt

# RUN wget --no-directories --progress=bar:force:noscroll -P /scratch/models https://the-eye.eu/public/AI/models/v-diffusion/secondary_model_imagenet_2.pth
