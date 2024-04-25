FROM pytorch/pytorch:latest

RUN pip install --no-cache-dir jupyterlab matplotlib
COPY ./jupylab.bash /usr/local/bin/jupylab
RUN chmod +x /usr/local/bin/jupylab
