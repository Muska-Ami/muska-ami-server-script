#/bin/bash

if which docker >/dev/null 2>&1; then
  info "检测到 Docker 已安装，跳过安装步骤"
  install_watchtower_agent
else
  info "安装 Docker 和 Docker Compose..."
  wget https://mirrors.locyan.cn/scripts/docker.sh -O /opt/ma_ss/temps/get-docker.sh
  wget https://mirrors.locyan.cn/github-release/docker/compose/LatestRelease/docker-compose-linux-x86_64 -O /usr/bin/docker-compose
  chmod +x /usr/bin/docker-compose
  sh get-docker.sh
  if [ $? -eq 0 ];then
    info "安装成功"
    install_watchtower_agent
  else
    error "安装 Docker 失败，请尝试手动安装"

install_watchtower_agent() {
    info "安装 Watchtower"
    mkdir -p /opt/watchtower
    info "希望 Agent 使用的端口"
    read -p ">" beszel_PORT
    info "面板上的 Public Key"
    read -p ">" beszel_KEY
    wget https://install.1l1.icu/templates/docker-compose/watchtower.yml -O /opt/watchtower/docker-compose.yml
    sed -i "s/\[PORT\]/$beszel_PORT" /opt/watchtower/docker-compose.yml
    sed -i "s/\[KEY\]/$beszel_KEY" /opt/watchtower/docker-compose.yml
    cd /opt/watchtower
    docker-compose up -d
    info "执行安装完成"
}
