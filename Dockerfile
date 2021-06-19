
FROM python:3.8-slim
LABEL maintainer="linzy@uniner.com"

#设置时区和时间同步
RUN cd / \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update \
    && apt install -y ntp \
    && service ntp restart


# install related packages
RUN pip3 config set global.index-url http://mirrors.aliyun.com/pypi/simple \
  && pip3 config set install.trusted-host mirrors.aliyun.com \
  && pip3 install --no-cache-dir --upgrade pip

