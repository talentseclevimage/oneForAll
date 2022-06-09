FROM python:3.10.4-bullseye
MAINTAINER milktea@vmoe.info

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get -y install git libffi-dev libxml2-dev libxslt-dev
RUN wget https://github.com/shmilylty/OneForAll/archive/refs/tags/v0.4.3.zip && \
unzip v0.4.3.zip 
WORKDIR ./OneForAll-0.4.3
RUN pip install uvloop -i https://mirrors.aliyun.com/pypi/simple/
RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
RUN git clone https://github.com/blechschmidt/massdns
WORKDIR ./massdns
RUN make 
RUN mv bin/massdns ../thirdparty/massdns/massdns_linux_x86_64
RUN cd .. && \
mkdir results
WORKDIR /OneForAll-0.4.3
