# 自动加载同目录 .env
set dotenv-load := true

# 启动单个业务: just up mysql | just up redis | just up postgres
# 共享网络由 compose.yml 自动创建/管理, 无需手动命令
up service:
    docker compose up -d {{service}}

# 停止单个业务（容器级移除, 共享网络与其他服务不受影响）
down service:
    docker compose stop {{service}}
    docker compose rm -f {{service}}

# 启动全部基础设施
up-all:
    docker compose up -d

# 停止全部（含共享网络, 因所有服务已停止）
down-all:
    docker compose down

# 格式化(Biome + rumdl,自动改写)
fmt:
    @echo ">> 格式化(js/ts + markdown)"
    @biome format --write . && rumdl fmt .

# 修复可修复的违规(有残留违规时退出 1)
fix:
    @echo ">> 修复(js/ts + markdown)违规"
    @biome check --write . && rumdl check --fix .
