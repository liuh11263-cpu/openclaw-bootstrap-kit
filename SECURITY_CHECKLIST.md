# SECURITY CHECKLIST

发布前/部署前逐项确认：

- [ ] 没有提交真实 token / 密钥 / chatId / cookies
- [ ] `.env` 不入库（仅 `.env.example` 入库）
- [ ] `gateway.bind=127.0.0.1`（除非明确要远程暴露）
- [ ] 如有反向代理，已配置 trusted proxies
- [ ] cron/pipeline 使用绝对路径，避免 PATH 失效
- [ ] 默认关闭高风险自动化（删除/外发/支付）
- [ ] README 中说明“如何轮换密钥”
