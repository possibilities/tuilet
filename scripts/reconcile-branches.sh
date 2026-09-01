#!/bin/bash

set -euo pipefail

# tuilet's entrypoint to the maintain skill's shared namespace script. It
# declares what MAINTAIN.md's Branch model says — the checkout, the remotes,
# the branch names, carry heads under `carry/` — and nothing else; the
# mechanics are the skill's and are tested there.

skill_dir="${MAINTAIN_SKILL_DIR:-$HOME/.local/share/agentstart/capabilities/packs/common/skills/maintain}"
script="$skill_dir/scripts/reconcile-branches.sh"
if [ ! -f "$script" ]; then
    printf 'tuilet branches: the maintain skill is not installed at %s (render ~/code/agentguidance, or set MAINTAIN_SKILL_DIR)\n' \
        "$skill_dir" >&2
    exit 1
fi

export MAINTAIN_WORKSHOP="$(cd "$(dirname "$0")/.." && pwd)"
export MAINTAIN_CHECKOUT="${TUILET_CHECKOUT:-$MAINTAIN_WORKSHOP/fork}"
export MAINTAIN_FORK_REPO=possibilities/opentui
export MAINTAIN_UPSTREAM_REPO=anomalyco/opentui
export MAINTAIN_FORK_REMOTE=fork
export MAINTAIN_UPSTREAM_REMOTE=origin
export MAINTAIN_MAIN_BRANCH=main
export MAINTAIN_INTEGRATION_BRANCH=integration
export MAINTAIN_CARRY_PREFIX=carry/
export MAINTAIN_WORKSHOP_CHECKOUTS="$MAINTAIN_CHECKOUT"
export MAINTAIN_QUARANTINE_PREFIX=DELETEME/
export MAINTAIN_PRESERVE_OPEN_PRS=1

exec bash "$script" "$@"
