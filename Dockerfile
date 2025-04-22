FROM n8nio/base:20

# 安裝必要套件
RUN apk add --no-cache \
    openssh \
    sudo \
    shadow \
    bash

# 設定 node 使用者可執行 sudo 不需密碼
RUN echo "node ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/node \
    && chmod 0440 /etc/sudoers.d/node

# 建立工作資料夾並賦予權限
RUN mkdir /workspace \
    && chown node:node /workspace

# 使用 node 身份執行以下指令
USER node

# 設定 pnpm 快取資料夾
RUN mkdir -p ~/.pnpm-store \
    && pnpm config set store-dir ~/.pnpm-store --global
