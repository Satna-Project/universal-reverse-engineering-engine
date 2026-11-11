#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
    echo "Usage: ./scripts/init_workspace.sh <target-name>"
    exit 1
fi

TARGET_NAME="$1"
WORKSPACE_DIR="workspaces/${TARGET_NAME}"

if [ -d "${WORKSPACE_DIR}" ]; then
    echo "Error: Workspace '${WORKSPACE_DIR}' already exists."
    exit 1
fi

echo "Initializing Reverse Engineering Workspace: ${WORKSPACE_DIR}..."

mkdir -p "${WORKSPACE_DIR}"/{artifacts,handoffs,reconstructed_src,tests,reports}

cp templates/00_target_definition.md "${WORKSPACE_DIR}/00_target_definition.md"
cp templates/01_evidence_register.md "${WORKSPACE_DIR}/01_evidence_register.md"
cp templates/02_agent_handoff_protocol.md "${WORKSPACE_DIR}/handoffs/02_agent_handoff_protocol.md"
cp templates/05_master_specification.md "${WORKSPACE_DIR}/05_master_specification.md"
cp templates/08_traceability_matrix.md "${WORKSPACE_DIR}/08_traceability_matrix.md"

cat <<EOF > "${WORKSPACE_DIR}/README.md"
# Reverse Engineering Workspace: ${TARGET_NAME}

Initialized on: $(date -u +"%Y-%m-%dT%H:%M:%SZ")

## Directory Layout
- \`00_target_definition.md\` — Phase 0 scope and constraints
- \`01_evidence_register.md\` — Phase 1 empirical artifact log
- \`05_master_specification.md\` — Phase 5 source-of-truth specification
- \`08_traceability_matrix.md\` — Phase 8 QA & verification matrix
- \`artifacts/\` — Place raw source files, HAR logs, screenshots, and configs here
- \`handoffs/\` — Archive Gemini <-> Claude relay payloads here
- \`reconstructed_src/\` — Phase 6 clean-room implementation code
- \`tests/\` — Phase 7 validation suites (Levels 1-6)
- \`reports/\` — Raw test execution outputs and final Phase 9 delivery report
EOF

echo "Workspace ready at ${WORKSPACE_DIR}/"
echo "Next step: Populate ${WORKSPACE_DIR}/00_target_definition.md and place raw files in ${WORKSPACE_DIR}/artifacts/"
