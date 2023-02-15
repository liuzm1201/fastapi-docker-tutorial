# fastapi-docker-tutorial

为方便开发者快速搭建 AI 模型服务，形成较为统一的代码和封装规范，变为后期维护和工程化应用。现初步抛出一个 AI 微服务搭建指引，以实现一个简单的`分词API`为例。

## 本地运行

```shell
# 创建虚拟环境
conda create -n tutorial python=3.8 -y

# 进入项目根目录/service
cd ./tutorial/service

# 安装环境依赖
pip install -r requirements.txt

# 运行服务
uvicorn main:app --host 0.0.0.0 --port 8000 --access-log --log-config log.conf --reload

# 调用API
curl --location --request POST 'http://localhost:8000/api/v1/tokenization' \
--header 'Content-Type: application/json' \
--data-raw '{
    "text": "小明硕士毕业于中国科学院计算所，后在日本京都大学深造",
    "mode": "accurate"
}'
```

## 正式环境运行

```shell
# 进入项目根目录
cd fastapi-docker-tutorial

# 生成镜像
docker build -t <image-name>:<image-tag> .
# docker build -t tutorial:0.0.1 .

# 运行镜像
docker run -d --name <container-name> -p <external-port>:8000 -v <some-path>/logs:/opt/logs --restart=always <image-name>:<image-tag>
# docker run -d --name tutorial -p 9000:8000 -v /home/logs:/opt/logs --restart=always tutorial:0.0.1

# 查看容器
docker ps -a | grep <container-name>

# 查看日志
docker logs -f <container-name>

# 测试API是否可用
POST <host-ip>:<external-port>/api/v1/tokenization
# localhost:9000/api/v1/tokenization
```
