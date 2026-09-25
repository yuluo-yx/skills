# Skills

分享一些有用的 skills。

## 已收录技能

| 技能名 | 说明 | 目录 |
| --- | --- | --- |
| `chinese-document-writing` | 统一中文技术文档的写作、改写、润色与审校规范 | [`./chinese-document-writing`](./chinese-document-writing) |

## 仓库结构

```text
.
├── LICENSE
├── README.md
├── scripts/
├── CONTRIBUTING.md
└── chinese-document-writing/
    ├── README.md
    ├── SKILL.md
    ├── agents/
    └── references/
```

## 安装

推荐在仓库根目录直接执行安装脚本：

```bash
bash scripts/install-chinese-document-writing.sh
```

默认会同时安装到以下位置：

- Codex：`~/.codex/skills/chinese-document-writing`
- Claude Code：`~/.claude/skills/chinese-document-writing`
- 默认使用软链接，仓库更新后会立即生效

可选参数：

- `--codex-only`：仅安装到 Codex
- `--claude-only`：仅安装到 Claude Code
- `--copy`：改为复制目录
- `--force`：覆盖现有目标

手动安装示例：

```bash
mkdir -p ~/.codex/skills ~/.claude/skills
ln -s "$(pwd)/chinese-document-writing" ~/.codex/skills/chinese-document-writing
ln -s "$(pwd)/chinese-document-writing" ~/.claude/skills/chinese-document-writing
```

如果你只需要其中一个客户端，保留对应那一行即可。

## 使用

安装完成后，可以在 Codex 和 Claude Code 中显式或隐式调用：

- 显式调用：`使用 $chinese-document-writing 重写这份 README。`
- 隐式调用：当任务明显是中文技术文档写作、润色或审校时，由支持技能自动触发的客户端自动使用

各技能的详细说明、触发条件与参考资料见对应目录下的 `README.md` 与 `SKILL.md`。

## 致谢

`chinese-document-writing` 技能整理参考了 [ruanyf/document-style-guide](https://github.com/ruanyf/document-style-guide) 中的中文技术文档规范。
