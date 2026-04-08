# chinese-document-writing

用于撰写、改写、润色或审校中文技术文档的技能。

它适合处理 README、安装指南、FAQ、接口文档、产品说明、知识库文章、发布说明和操作手册等内容，目标是让文档结构清楚、句子简洁、术语一致、可直接交付。

## 包含内容

- `SKILL.md`：技能定义、触发条件、工作流与输出要求
- `references/style-rules.md`：中文技术文档风格规则
- `references/templates.md`：常见文档结构模板
- `references/checklist.md`：交付前自检清单
- `agents/openai.yaml`：客户端展示名称与默认提示词

## 适用场景

以下场景适合使用这个技能：

- 重写杂乱的中文 README
- 统一团队文档的标题、标点、数字和术语风格
- 把零散笔记整理成正式的操作手册或知识库文章
- 审校发布说明、FAQ 或产品说明文档

以下场景通常不需要单独调用：

- 只翻译一个短句
- 只改一个按钮文案

## 安装

推荐在仓库根目录执行：

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

- 优先按文档类型选择结构模板
- 强调主动句、短句和一致术语
- 对数字、单位、时间、标点和引用做统一规范
- 交付前要求按清单自检，避免格式问题和表达跳跃

## 参考来源

本技能的中文技术文档规范整理参考了 [ruanyf/document-style-guide](https://github.com/ruanyf/document-style-guide)。
