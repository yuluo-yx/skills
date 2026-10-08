#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SOURCE_DIR="$(cd "${SCRIPT_DIR}/.." && pwd -P)"
SKILL_NAME="chinese-document-writing"
INSTALL_MODE="symlink"
INSTALL_CODEX=true
INSTALL_CLAUDE=true
FORCE=false

CODEX_TARGET_DIR="${HOME}/.codex/skills/${SKILL_NAME}"
CLAUDE_TARGET_DIR="${HOME}/.claude/skills/${SKILL_NAME}"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install-chinese-document-writing.sh [options]

Options:
  --codex-only     Install for Codex only
  --claude-only    Install for Claude Code only
  --copy           Copy skill files instead of creating a symlink
  --force          Replace an existing skill installation
  -h, --help       Show help

Defaults:
  Install for both Codex and Claude Code using symlinks.
EOF
}

log() {
  printf '%s\n' "$1"
}

install_one() {
  local label="$1"
  local target="$2"

  if [[ ! -L "${target}" && -d "${target}" && "$(cd "${target}" && pwd -P)" == "${SOURCE_DIR}" ]]; then
    log "[skip] ${label} already points to the source: ${target}"
    return 0
  fi

  mkdir -p "$(dirname "${target}")"
  if [[ -e "${target}" || -L "${target}" ]]; then
    if [[ "${FORCE}" != true ]]; then
      log "[skip] ${label} already exists: ${target}"
      log "       Use --force to replace it."
      return 0
    fi
    if [[ -L "${target}" ]]; then
      unlink "${target}"
    elif [[ -d "${target}" && -f "${target}/SKILL.md" ]] && grep -qx "name: ${SKILL_NAME}" "${target}/SKILL.md"; then
      find "${target}" -depth -delete
    else
      log "[error] Refusing to replace a path that is not this skill: ${target}"
      return 1
    fi
  fi

  if [[ "${INSTALL_MODE}" == "copy" ]]; then
    mkdir -p "${target}"
    cp -R "${SOURCE_DIR}/SKILL.md" "${SOURCE_DIR}/README.md" "${SOURCE_DIR}/LICENSE" \
      "${SOURCE_DIR}/agents" "${SOURCE_DIR}/references" "${SOURCE_DIR}/scripts" "${target}/"
    log "[done] ${label} copied to: ${target}"
  else
    ln -s "${SOURCE_DIR}" "${target}"
    log "[done] ${label} linked to: ${target}"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --codex-only) INSTALL_CODEX=true; INSTALL_CLAUDE=false ;;
    --claude-only) INSTALL_CODEX=false; INSTALL_CLAUDE=true ;;
    --copy) INSTALL_MODE="copy" ;;
    --force) FORCE=true ;;
    -h|--help) usage; exit 0 ;;
    *) log "Unknown option: $1"; usage; exit 1 ;;
  esac
  shift
done

if [[ ! -f "${SOURCE_DIR}/SKILL.md" ]]; then
  log "Skill entrypoint not found: ${SOURCE_DIR}/SKILL.md"
  exit 1
fi

if [[ "${INSTALL_CODEX}" == true ]]; then
  install_one "Codex" "${CODEX_TARGET_DIR}"
fi
if [[ "${INSTALL_CLAUDE}" == true ]]; then
  install_one "Claude Code" "${CLAUDE_TARGET_DIR}"
fi

log "Installation complete."
