# awdocker

本地开发基础设施（Docker Compose）：MySQL、Redis、PostgreSQL，并以 PostgreSQL 作为统一配置数据源（sqlx 管理迁移）。

## 快速开始

```bash
cp .env.example .env
just up-all
just setup-db
```

## 常用命令

| 命令 | 说明 |
| --- | --- |
| `just up-all` / `just down-all` | 启动/停止全部服务 |
| `just up <svc>` / `just down <svc>` | 启动/停止单个服务（mysql/redis/postgres） |
| `just setup-db` | 拉起 PostgreSQL → 建库 → 应用全部迁移 |
| `just migrate` | 执行全部待执行迁移 |
| `just migrate-new <name>` | 新建前向-only 迁移文件 |
