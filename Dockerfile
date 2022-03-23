FROM python:3.8.9
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

RUN apt-get install -y vim less
RUN pip install --upgrade pip
COPY requirements.txt /root/requirements.txt
RUN pip install -r /root/requirements.txt
