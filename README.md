# awdocker

本地开发基础设施（Docker Compose）：MySQL、Redis、PostgreSQL。

## 快速开始

```bash
cp .env.example .env
just up-all
```

## 常用命令

| 命令 | 说明 |
| --- | --- |
| `just up-all` / `just down-all` | 启动/停止全部服务 |
| `just up <svc>` / `just down <svc>` | 启动/停止单个服务（mysql/redis/postgres） |

## 作为新项目的共享基础设施（单一真相源）

基础设施定义拆为可 `include` 的片段：`postgres.yml` / `mysql.yml` / `redis.yml`。
新根节点项目**不要重复定义**这些服务，而是复用本仓库：

1. 把本仓库作为子模块加入新项目（独立克隆时使用），统一置于 `vendor/` 下、以本仓名为目录：

   ```bash
   git submodule add git@github.com:awenx8/awdocker.git vendor/awdocker
   ```

2. 新项目的 `compose.yml` 用 `include` 拉取所需片段，自身只定义应用服务：

   ```yaml
   include:
     - ${AWDOCKER_PATH:-vendor/awdocker}/postgres.yml
     - ${AWDOCKER_PATH:-vendor/awdocker}/redis.yml

    services:
      awserver:
        depends_on:
          postgres: { condition: service_healthy }
          redis:    { condition: service_healthy }
        networks: [awinfra]
    networks:
      awinfra:
        name: ${INFRA_NETWORK}
    ```

   > 应用仓的 `awinfra` 必须带上 `name: ${INFRA_NETWORK}`，且其 `.env` 中的
   > `INFRA_NETWORK` 要与 infra 片段一致，否则两端不在同一 Docker 网络，无法互通。

> 片段内所有参数（密码、端口、库名、网络名）均**只通过 env 注入，不含任何硬编码默认值**；
> 各应用仓用自身 `.env` 提供，基础设施片段本身只维护一份。共享网络名由 `INFRA_NETWORK`
> 决定，应用仓与 infra 片段须设成相同值才能互通。
