# Gemini <-> Claude Handoff Protocol

## Outbound Task (Gemini -> Claude)

```text
=== GEMINI -> CLAUDE HANDOFF PAYLOAD ===
TASK ID: [e.g., P2-DECOMP-01]
OBJECTIVE: [Specific analytical or reconstruction goal]
AVAILABLE EVIDENCE: [EV-001, EV-002 + attached raw code/log blocks]
CONTEXT: [Current architectural baseline and upstream dependencies]
ANALYSIS REQUIRED:
1. [Question 1]
2. [Question 2]
EXPECTED OUTPUT: [Schema, state table, or component specification]
CONSTRAINTS: [Do not infer unprovided endpoints; cite EV-IDs for every claim]
VERIFICATION CRITERIA: [How Gemini will audit this output]
UNANSWERED QUESTIONS: [Specific ambiguities to resolve]