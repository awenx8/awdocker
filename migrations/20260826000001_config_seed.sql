-- 本种子仅写入与部署环境无关的通用默认值。
INSERT INTO app_config (group_name, key, value, description) VALUES
    ('app', 'env', 'dev', '运行环境: dev / online / staging'),
    ('server', 'host', '0.0.0.0', 'HTTP 监听地址'),
    ('server', 'http_port', '8080', 'HTTP 监听端口'),
    ('server', 'grpc_port', '9090', 'gRPC 监听端口'),
    ('log', 'level', 'info', '日志级别: trace/debug/info/warn/error'),
    ('log', 'format', 'pretty', '日志格式: pretty / json'),
    ('feature', 'maintenance_mode', 'false', '全局维护模式开关')
ON CONFLICT (group_name, key) DO NOTHING;
