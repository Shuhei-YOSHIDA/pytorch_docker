FROM pytorch/pytorch:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime &&\
    apt-get update && apt-get install -y libopencv-dev && apt-get clean && rm -rf /var/lib/apt/lists*
RUN pip install --no-cache-dir jupyterlab matplotlib opencv-python pandas scipy tensorboard tensorboardX scikit-learn
COPY ./jupylab.bash /usr/local/bin/jupylab
RUN chmod +x /usr/local/bin/jupylab
