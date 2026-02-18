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

## 快速开始（傻瓜版）

> 你报的这个错本质是：还没在仓库目录里执行命令。
> 正确写法是：`cp .env.example .env`（中间有空格），不是 `cp.env.example.env`。

### 0) 先下载仓库

#### macOS / Linux
```bash
git clone https://github.com/liuh11263-cpu/openclaw-bootstrap-kit.git
cd openclaw-bootstrap-kit
ls -la   # 看到 .env.example 才是正确目录
```

#### Windows (PowerShell)
```powershell
git clone https://github.com/liuh11263-cpu/openclaw-bootstrap-kit.git
cd .\openclaw-bootstrap-kit
Get-ChildItem -Force   # 看到 .env.example 才是正确目录
```

### 1) 复制环境变量模板

#### macOS
```bash
cp .env.example .env
```

#### Windows (PowerShell)
```powershell
Copy-Item .env.example .env
```

### 2) 编辑 `.env`
填入你的 token / chatId / 模型等配置。

### 3) 执行安装 + 配置 + 自检

#### macOS
```bash
bash setup/openclaw-bootstrap.sh
bash setup/openclaw-configure.sh
bash setup/openclaw-doctor.sh
```

#### Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-bootstrap.ps1
powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-configure.ps1
powershell -ExecutionPolicy Bypass -File .\setup\windows\openclaw-doctor.ps1
```

### 4) 常见报错（必看）
- `No such file or directory: .env.example`
  - 你不在仓库目录；先 `cd openclaw-bootstrap-kit`
- `cp.env.example.env: command not found`
  - 命令写错了，正确是 `cp .env.example .env`
- `openclaw: command not found`
  - 先重开终端，或检查 Node/npm 全局路径是否生效

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
