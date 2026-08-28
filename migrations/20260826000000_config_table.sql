CREATE TABLE IF NOT EXISTS app_config (
    group_name  TEXT NOT NULL DEFAULT 'default',
    key         TEXT NOT NULL,
    value       TEXT NOT NULL,
    description TEXT NOT NULL DEFAULT '',
    PRIMARY KEY (group_name, key)
);

CREATE INDEX IF NOT EXISTS idx_app_config_group ON app_config (group_name);

COMMENT ON TABLE app_config IS '统一应用配置表：所有应用配置按 group_name 分组、以键值行存储，作为唯一数据源';
COMMENT ON COLUMN app_config.group_name IS '配置分组，如 app / server / log / feature';
COMMENT ON COLUMN app_config.key IS '分组内的叶子键名，全局唯一由 (group_name, key) 保证';
