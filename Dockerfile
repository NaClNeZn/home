FROM registry.cn-beijing.aliyuncs.com/drgeek-common/nginx:stable-perl
ENV server_port ${server_port}

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

COPY dist/ /usr/share/nginx/html
# COPY --from=builder $PROJECT_DIR/nginx.conf /etc/nginx/nginx.conf

EXPOSE ${server_port}
