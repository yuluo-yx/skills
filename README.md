# Skills

Shown Skills，分享一些有用的 skills。

## 已收录技能

| 技能名 | 说明 | 目录 |
| --- | --- | --- |
| `chinese-document-writing` | 统一中文技术文档的写作、改写、润色与审校规范 | [`./chinese-document-writing`](./chinese-document-writing) |

## 仓库结构

```text
.
├── LICENSE
├── README.md
├── CONTRIBUTING.md
└── chinese-document-writing/
    ├── README.md
    ├── SKILL.md
    ├── agents/
    └── references/
```

## 安装

将需要的技能目录复制或软链接到你的本地技能目录即可。

常见安装位置示例：

- Codex：`~/.codex/skills/`
- 其他兼容 `SKILL.md` 的客户端：按各自约定的技能目录放置

示例一：复制目录

```bash
cp -R chinese-document-writing ~/.codex/skills/
```

示例二：使用软链接

```bash
ln -s "$(pwd)/chinese-document-writing" ~/.codex/skills/chinese-document-writing
```

如果你的客户端使用其他技能目录，只需替换目标路径。

## 使用

安装完成后，可以显式或隐式调用：

- 显式调用：`使用 $chinese-document-writing 重写这份 README。`
- 隐式调用：当任务明显是中文技术文档写作、润色或审校时，由支持技能自动触发的客户端自动使用

各技能的详细说明、触发条件与参考资料见对应目录下的 `README.md` 与 `SKILL.md`。

## 致谢

`chinese-document-writing` 技能整理参考了 [ruanyf/document-style-guide](https://github.com/ruanyf/document-style-guide) 中的中文技术文档规范。
