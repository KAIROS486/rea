# rea

이 저장소는 [REA (Reverse Engineer Anything)](https://github.com/morluto/rea)를 Claude Code에서 쓸 수 있게 설정해 둔 곳입니다.

- `.mcp.json` — REA MCP 서버 등록 (`npx -y rea-agents@6.4.0 mcp`)
- `.claude/skills/reverse-engineer-anything/` — REA 워크플로 스킬

로컬 PC에 설치하려면 Node.js를 설치한 뒤 다음을 실행하세요:

```bash
npx rea-agents setup
```

업데이트: `npx rea-agents@latest setup` (또는 전역 설치 시 `rea update`)
