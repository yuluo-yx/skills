#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SKILL_NAME="chinese-document-writing"
SOURCE_DIR="${REPO_ROOT}/${SKILL_NAME}"
INSTALL_MODE="symlink"
INSTALL_CODEX=true
INSTALL_CLAUDE=true
FORCE=false

CODEX_TARGET_DIR="${HOME}/.codex/skills/${SKILL_NAME}"
CLAUDE_TARGET_DIR="${HOME}/.claude/skills/${SKILL_NAME}"

usage() {
  cat <<'EOF'
用法：
  bash scripts/install-chinese-document-writing.sh [选项]

选项：
  --codex-only     仅安装到 Codex
  --claude-only    仅安装到 Claude Code
  --copy           使用复制而不是软链接
  --force          覆盖已存在的目标
  -h, --help       显示帮助

默认行为：
  同时安装到 ~/.codex/skills/ 和 ~/.claude/skills/
  默认使用软链接，便于仓库更新后立即生效
EOF
}

log() {
  printf '%s\n' "$1"
}

install_one() {
  local label="$1"
  local target="$2"

  mkdir -p "$(dirname "${target}")"

  if [[ -e "${target}" || -L "${target}" ]]; then
    if [[ "${FORCE}" == true ]]; then
      rm -rf "${target}"
    else
      log "[跳过] ${label} 已存在：${target}"
      log "       如需覆盖，请重新执行并追加 --force"
      return 0
    fi
  fi

  if [[ "${INSTALL_MODE}" == "copy" ]]; then
    cp -R "${SOURCE_DIR}" "${target}"
    log "[完成] ${label} 已复制到：${target}"
  else
    ln -s "${SOURCE_DIR}" "${target}"
    log "[完成] ${label} 已链接到：${target}"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --codex-only)
      INSTALL_CODEX=true
      INSTALL_CLAUDE=false
      ;;
    --claude-only)
      INSTALL_CODEX=false
      INSTALL_CLAUDE=true
      ;;
    --copy)
      INSTALL_MODE="copy"
      ;;
    --force)
      FORCE=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      log "未知参数：$1"
      usage
      exit 1
      ;;
  esac
  shift
done

if [[ ! -d "${SOURCE_DIR}" ]]; then
  log "未找到技能目录：${SOURCE_DIR}"
  exit 1
fi

if [[ "${INSTALL_CODEX}" == false && "${INSTALL_CLAUDE}" == false ]]; then
  log "没有可安装目标。请至少选择 Codex 或 Claude Code。"
  exit 1
fi

if [[ "${INSTALL_CODEX}" == true ]]; then
  install_one "Codex" "${CODEX_TARGET_DIR}"
fi

if [[ "${INSTALL_CLAUDE}" == true ]]; then
  install_one "Claude Code" "${CLAUDE_TARGET_DIR}"
fi

log ""
log "安装完成。"
log "Codex 技能目录：${HOME}/.codex/skills/"
log "Claude Code 技能目录：${HOME}/.claude/skills/"
log "回滚方式：删除对应目录或软链接即可。"
