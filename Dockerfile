# 使用官方 Python 3.9 镜像作为基础镜像
FROM python:3.9

# 设置工作目录
WORKDIR /app

# 安装 Git
RUN apt-get update && apt-get install -y git

# 克隆你的 Git 存储库
RUN git clone https://github.com/helloflask/watchlist.git .

RUN cd watchlist

# 安装项目依赖项
RUN pip install -r requirements.txt

RUN flask forge

# 定义容器启动时的命令
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
