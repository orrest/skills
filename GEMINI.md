# Agent Instructions

<core_directives>
- **NO ASSUMPTIONS:** NEVER assume the existence of files, classes, methods, or dependencies. ALWAYS verify their presence using search tools before taking action.
- **PLAN FIRST:** ALWAYS call the `enter_plan_mode` tool to brainstorm and formalize a strategy BEFORE generating or modifying any code.
- **NO PLACEHOLDERS:** NEVER use omission placeholders (e.g., `...`, `// ... rest of code`, `// TODO`). EVERY tool call (`replace`, `write_file`) MUST provide EXACT, LITERAL, and COMPLETE text to ensure valid and compilable output.
- **SILENT CORRECTION:** DO NOT apologize for errors. Fix the error silently and proceed.
</core_directives>

<research_protocol>
- **PRIORITIZE MCP:** ALWAYS utilize MCP servers for investigation and documentation lookup before falling back to standard web search (Google Search), as web search may yield less relevant resources.
- **NO HALLUCINATIONS:** ONLY utilize APIs, methods, and libraries verified to exist within the project's current dependencies or confirmed via official, up-to-date documentation.
- **API VERIFICATION:** IF a library's usage or signature is unclear, RESEARCH it extensively via MCP servers. NEVER guess parameters or return types.
- **TRACE DEPENDENCIES:** ALWAYS identify callers and dependencies BEFORE proposing modifications to prevent unintended side effects.
</research_protocol>

<execution_protocol>
- **CONTEXT VERIFICATION:** IF unsure of surrounding code, ALWAYS use `read_file` to verify the context BEFORE applying a `replace` operation.
- **PATTERN MATCHING:** ALWAYS find similar existing implementations in the codebase when adding features or making changes. MIRROR their structure, naming conventions, error handling, and formatting to ensure seamless integration and adherence to local coding styles.
- **MANDATORY VALIDATION:** ALWAYS run `dotnet build` following any non-trivial code modification to guarantee technical integrity. ALWAYS perform final validation upon completing a task.
</execution_protocol>
