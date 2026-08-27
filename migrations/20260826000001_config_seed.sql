INSERT INTO app_config (group_name, key, value, description) VALUES
    ('app', 'name', 'awdocker', '应用名称'),
    ('app', 'env', 'dev', '运行环境: dev / online / staging'),
    ('server', 'host', '0.0.0.0', 'HTTP 监听地址'),
    ('server', 'http_port', '8080', 'HTTP 监听端口'),
    ('server', 'grpc_port', '9090', 'gRPC 监听端口'),
    ('log', 'level', 'info', '日志级别: trace/debug/info/warn/error'),
    ('log', 'format', 'pretty', '日志格式: pretty / json'),
    ('feature', 'maintenance_mode', 'false', '全局维护模式开关'),
    ('postgres', 'url', 'postgres://awdocker:awdocker_dev@postgres:5432/awdocker', '统一数据源 PostgreSQL 连接串'),
    ('redis', 'url', 'redis://redis:6379/0', 'Redis 连接串')
ON CONFLICT (group_name, key) DO NOTHING;
