
# Adaptive Domain Inspection Profiles

Select the primary profile during **Phase 0 (Target Definition)** based on the target system category. For hybrid targets (such as a full-stack SaaS product), combine the relevant profiles.

## Profile A: Websites, Web Apps & UI/UX Systems
* **Discovery Artifacts:** HTML DOM snapshots, bundled JS/CSS sourcemaps, DevTools HAR network captures, LocalStorage/IndexedDB dumps, screenshots/screen recordings.
* **Decomposition Focus:** UI component hierarchy, client-side routing table, global state store mutations, API client interceptors.
* **Differential Validation:** DOM structural parity, viewport responsiveness, network payload equivalence, state transition accuracy.

## Profile B: APIs, Microservices & Backend Systems
* **Discovery Artifacts:** OpenAPI/Swagger specs, Postman collections, HAR/PCAP traffic logs, gateway configs, error response payloads, database DDL schemas.
* **Decomposition Focus:** Authentication/authorization flows, rate-limiting headers, endpoint request/response contracts, idempotency behavior, webhook triggers.
* **Differential Validation:** Status code parity across valid/invalid inputs, JSON schema validation, latency and error-code equivalence.

## Profile C: Codebases, Desktop Software & Open-Source Repositories
* **Discovery Artifacts:** Directory trees, lockfiles (`package-lock.json`, `Cargo.lock`, `poetry.lock`), source files, build scripts, unit test suites, runtime logs.
* **Decomposition Focus:** Dependency graph, entry points, core domain modules, I/O adapters, concurrency model, configuration loader.
* **Differential Validation:** AST/type-check compilation, unit/integration test pass rates, CLI/GUI output equivalence across identical seed inputs.

## Profile D: File Formats, Binary Protocols & Data Pipelines
* **Discovery Artifacts:** Sample valid/corrupt files, hex dumps, Wireshark PCAP captures, serializer/deserializer logs, ETL transformation configs.
* **Decomposition Focus:** Magic bytes/headers, framing boundaries, endianness, TLV (Type-Length-Value) structures, checksum algorithms, state machine transitions.
* **Differential Validation:** Byte-for-byte round-trip serialization parity (`parse(serialize(x)) == x`), malformed input rejection parity.

## Profile E: AI Applications & Automation Workflows
* **Discovery Artifacts:** System prompt captures, tool/function definitions, orchestration JSON exports (n8n, LangGraph, custom), trace logs, evaluation datasets.
* **Decomposition Focus:** Context window assembly, routing classifiers, tool-calling schemas, fallback/retry loops, memory persistence layers, guardrails.
* **Differential Validation:** Structured output schema adherence, deterministic routing decisions on benchmark prompts, tool-call argument accuracy.
