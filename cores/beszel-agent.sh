#/bin/bash

if which docker >/dev/null 2>&1; then
  info "检测到 Docker 已安装，跳过安装步骤"
else
  info "安装 Docker 和 Docker Compose..."
  curl https://mirrors.locyan.cn/scripts/docker.sh -o /opt/ma_ss/temps/get-docker.sh
  curl https://mirrors.locyan.cn/github-release/docker/compose/LatestRelease/docker-compose-linux-x86_64 -o /usr/bin/docker-compose
  chmod +x /usr/bin/docker-compose
  sh get-docker.sh
  if [ $? -eq 0 ];then
    info "安装成功"
    info "安装 Beszel Agent"
    mkdir -p /opt/beszel
    info "希望 Agent 使用的端口"
    read -p ">" beszel_PORT
    info "面板上的 Public Key"
    read -p ">" beszel_KEY
    curl https://install.1l1.icu/templates/docker-compose/beszel-agent.yml -o /opt/beszel/docker-compose.yml
    sed -i "s/\[PORT\]/$beszel_PORT" /opt/beszel/docker-compose.yml
    sed -i "s/\[KEY\]/$beszel_KEY" /opt/beszel/docker-compose.yml
    cd /opt/beszel
    docker-compose up -d
    info "配置 Watchtower 自动更新容器"
    docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower beszel-agent
    info "执行安装完成"
  else
    error "安装 Docker 失败，请尝试手动安装"
