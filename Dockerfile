# 基础镜像
FROM python:3.8-slim-bullseye

# 替换Debian默认源
COPY conf/sources.list /etc/apt/sources.list

# 设置pip国内源
COPY conf/pip.conf /root/.pip/pip.conf

# 时区环境变量
ENV TIMEZONE=Asia/Shanghai

# 更新debian源、设置时区、更新pip为最新版本
RUN apt-get update -y && \
    ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone && \
    pip install --upgrade pip

# 指定工作目录
WORKDIR /opt

# 复制源码
COPY service service

# 安装依赖
RUN mkdir service/logs && \
    pip install --no-cache-dir -r service/requirements.txt && \
    chmod 777 -R service/start.sh

# 启动命令
CMD ["/bin/bash", "-c", "/opt/service/start.sh"]
