# 使用官方nginx镜像作为基础镜像
FROM nginx:latest

# 设置维护者信息
LABEL maintainer="your-email@example.com"
LABEL description="草方格铺设设备云平台 - 沙漠治理设备监控系统"
LABEL version="1.0"

# 删除nginx默认配置
RUN rm -rf /usr/share/nginx/html/*

# 复制项目文件到nginx默认目录
COPY . /usr/share/nginx/html/

# 复制自定义nginx配置文件
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 设置文件权限
RUN chmod -R 755 /usr/share/nginx/html

# 暴露80端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]
