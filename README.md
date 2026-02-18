# OpenClaw Bootstrap Kit (Shareable)

一键安装 + 可重复配置 + 健康检查，用于在新机器上快速落地 OpenClaw。

## 平台支持（很重要）
- ✅ **macOS（已支持）**：`setup/openclaw-*.sh`
- ✅ **Windows（已支持，PowerShell）**：`setup/windows/openclaw-*.ps1`
- ⚠️ **Linux（未验证）**：理论可移植，但依赖安装与路径需单独适配。

## 目标
- 5~10 分钟完成基础可用环境
- 配置可重复执行（idempotent）
- 默认安全基线（本地回环、占位 token、不落敏感信息）

## 快速开始

### macOS
```bash
cp .env.example .env
# 编辑 .env，填入你的密钥与参数

bash setup/openclaw-bootstrap.sh
bash setup/openclaw-configure.sh
bash setup/openclaw-doctor.sh
```

### Windows (PowerShell)
```powershell
Copy-Item .env.example .env
# 编辑 .env，填入你的密钥与参数

powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-bootstrap.ps1
powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-configure.ps1
powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-doctor.ps1
```

## 文件结构
- `setup/openclaw-bootstrap.sh`：macOS 安装依赖与基础目录
- `setup/openclaw-configure.sh`：macOS 渲染配置到 `~/.openclaw/openclaw.json`
- `setup/openclaw-doctor.sh`：macOS 健康检查
- `setup/windows/openclaw-bootstrap.ps1`：Windows 安装依赖与基础目录
- `setup/windows/openclaw-configure.ps1`：Windows 渲染配置到 `%USERPROFILE%\.openclaw\openclaw.json`
- `setup/windows/openclaw-doctor.ps1`：Windows 健康检查
- `templates/openclaw.template.json`：可分享配置模板（无敏感值）
- `.env.example`：环境变量占位符
- `SECURITY_CHECKLIST.md`：发布前/部署前安全自检

## 注意
- 本仓库是“分享版”，不含你的 chatId、token、账号凭据。
- 部署前必须按 `SECURITY_CHECKLIST.md` 逐项检查。
