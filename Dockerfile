# 构建应用
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN [ ! -e ".env" ] && cp .env.example .env || true
RUN npm run build

# 最小化镜像
FROM registry.cn-beijing.aliyuncs.com/drgeek-common/nginx:stable-perl

ENV server_port ${server_port}

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
COPY ./dist/ /usr/share/nginx/html

EXPOSE ${server_port}
