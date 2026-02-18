# OpenClaw Bootstrap Kit (Shareable)

一键安装 + 可重复配置 + 健康检查，用于在新 macOS 机器上快速落地 OpenClaw。

## 目标
- 5~10 分钟完成基础可用环境
- 配置可重复执行（idempotent）
- 默认安全基线（本地回环、占位 token、不落敏感信息）

## 快速开始
```bash
cp .env.example .env
# 编辑 .env，填入你的密钥与参数

bash setup/openclaw-bootstrap.sh
bash setup/openclaw-configure.sh
bash setup/openclaw-doctor.sh
```

## 文件结构
- `setup/openclaw-bootstrap.sh`：安装依赖与基础目录
- `setup/openclaw-configure.sh`：把模板配置渲染到 `~/.openclaw/openclaw.json`
- `setup/openclaw-doctor.sh`：健康检查
- `templates/openclaw.template.json`：可分享配置模板（无敏感值）
- `.env.example`：环境变量占位符
- `SECURITY_CHECKLIST.md`：发布前/部署前安全自检

## 注意
- 本仓库是“分享版”，不含你的 chatId、token、账号凭据。
- 部署前必须按 `SECURITY_CHECKLIST.md` 逐项检查。
