# chinese-document-writing

用于撰写、改写、校对或审阅中文技术文档及相关产品、界面文案的技能。

适用于 README、安装指南、FAQ、接口文档、产品说明、知识库文章、发布说明、操作手册和故障排查。优先保留事实、条件、限制与机器可读内容，再改善结构、措辞和排版。

## 包含内容

- `SKILL.md`：技能定义、触发条件、工作流与输出要求
- `references/style-rules.md`：中文技术文档风格规则
- `references/templates.md`：常见文档结构模板
- `references/checklist.md`：交付前自检清单
- `references/api-status-copy.md`：API 参数、状态与错误文案
- `references/controlled-technical-chinese.md`：操作步骤、风险与故障排查规则
- `references/sources.md`：来源版本、采用范围与许可说明
- `references/fenng-license.txt`：Fenng 上游的 MIT 许可
- `agents/openai.yaml`：客户端展示名称与默认提示词

## 适用场景

以下场景适合使用这个技能：

- 重写杂乱的中文 README
- 统一团队文档的标题、标点、数字和术语风格
- 把零散笔记整理成正式的操作手册或知识库文章
- 审校发布说明、FAQ 或产品说明文档

以下场景通常不需要单独调用：

- 只翻译一个短句
- 只改一个按钮文案，且没有明确要求应用本规范

## 安装

推荐在仓库根目录（包含 `chinese-document-writing/` 和 `scripts/` 的目录）执行：

```bash
bash scripts/install-chinese-document-writing.sh
```

默认会同时安装到：

- Codex：`~/.codex/skills/chinese-document-writing`
- Claude Code：`~/.claude/skills/chinese-document-writing`

如果只想安装到单个平台：

```bash
bash scripts/install-chinese-document-writing.sh --codex-only
```

```bash
bash scripts/install-chinese-document-writing.sh --claude-only
```

如果希望复制目录而不是软链接，可以追加 `--copy`。

手动安装示例：

```bash
mkdir -p ~/.codex/skills ~/.claude/skills
ln -s "$(pwd)/chinese-document-writing" ~/.codex/skills/chinese-document-writing
ln -s "$(pwd)/chinese-document-writing" ~/.claude/skills/chinese-document-writing
```

## 使用方式

显式调用示例：

```text
使用 $chinese-document-writing 把这份安装指南改写成正式中文技术文档。
```

```text
使用 $chinese-document-writing 审校这份 README，统一标题层级、标点和术语。
```

如果客户端支持隐式触发，在任务明显属于中文技术文档写作、润色或审校时，也可以自动调用。

回滚方式：删除 `~/.codex/skills/chinese-document-writing` 或 `~/.claude/skills/chinese-document-writing` 即可。

## 技能特点

- 区分撰写、改写、校对与审阅，按授权范围修改
- 保留事实、确定程度、条件、风险和机器可读内容，明确资料缺口
- 按需读取结构模板、API 文案和操作手册规则
- 默认采用直角引号、中西文留白和中文 Markdown 一段一行，服从目标项目约定
- 交付前对照来源复核，避免排版修改影响语义或代码

## 参考来源

本技能融合 [ruanyf/document-style-guide](https://github.com/ruanyf/document-style-guide) 和 Fenng 的 [tech-doc-style-chinese](https://github.com/Fenng/tech-doc-style-chinese) 规范。上游版本、采用范围、许可及原有规则的调整见 [来源说明](references/sources.md)。

旧的 `tech-doc-style-chinese` 使用入口可替换为 `$chinese-document-writing`。这是写作规范整合，不涉及产品数据迁移；没有迁入上游的检查脚本、测试或远端 workflow。
