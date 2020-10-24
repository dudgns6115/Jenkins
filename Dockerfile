FROM dev:ubuntu_18.04

RUN apt-get install -y python3 python3-pip openjdk-8-jre wget

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip

RUN pip install jupyter

RUN pip install matplotlib

WORKDIR /home/root/

RUN wget -O pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-2019.1.tar.gz"

RUN tar -xf pycharm.tar.gz --directory /opt

Run ln -s "/opt/pycharm-community-2019.1/bin/pycharm.sh" /usr/bin/pycharm

RUN jupyter notebook --generate-config --allow-root

RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

ENTRYPOINT jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser
