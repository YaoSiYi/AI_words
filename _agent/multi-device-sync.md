# 多设备 Codex 同步方案

## 目标

多台电脑都可以本地使用 Codex，同时共享同一套小说工作区结构、模板和小说 skills。

## 同步内容

建议进入 Git：

- `_agent/`
- `_templates/`
- `_skills/`
- `AGENTS.md`
- `.gitignore`
- 各小说项目中的设定、剧情结构、正文草稿、状态快照和参考索引

不建议进入 Git：

- `~/.codex/auth.json`
- API key、SSH key、`.env`
- Codex 日志、缓存、临时文件
- 浏览器登录状态
- 未确认需要归档的大型导出包

## 新设备安装流程

1. 安装 Codex 并登录。
2. 拉取这个小说项目仓库。
3. 进入仓库根目录。
4. 运行：

```bash
scripts/install-novel-skills.sh
```

5. 验证：

```bash
scripts/verify-novel-skills.sh
```

6. 如果新 skill 没出现，重启 Codex。

## CODEX_HOME

默认安装到：

```text
~/.codex/skills
```

如果某台设备使用了自定义 Codex home：

```bash
CODEX_HOME=/path/to/codex-home scripts/install-novel-skills.sh
```

## 推荐 Git 节奏

- 每次大规模整理设定前先提交一次。
- 每次完成章节、卷纲或状态快照后提交一次。
- 多设备切换前先拉取最新版本。
- 如果两台设备同时改同一章，先手动比对再合并，不要直接覆盖。

## 安全原则

项目文件可以同步，身份凭据不要同步。

Codex 登录缓存等同于密码材料，只能留在本机或通过官方登录流程重新生成。
