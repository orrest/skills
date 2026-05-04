---
name: learn
description: Used for other skill to get facts/knowledge rather than gusses. Routes to MCP skills (microsoft-docs, microsoft-code-reference) on demand to provide evidence.
metadata:
  version: "1.0.0"
---

# Learn: Authoritative Knowledge Routing

`learn` is the knowledge routing layer. It ensures that any task requiring facts, procedures, or code signatures is grounded in official Microsoft documentation instead of being hallucinated or guessed.

## Flow

1. Identify the knowledge gap: what specific fact, procedure, or signature is missing?
2. Determine the best knowledge source:
    - **Concepts, tutorials, configuration, or limits?** -> Route to `microsoft-docs`.
    - **Code samples, API signatures, or SDK usage patterns?** -> Route to `microsoft-code-reference`.
    - **Both?** -> Sequence them (usually `microsoft-docs` then `microsoft-code-reference`).
3. Delegate to the chosen skill(s) via sub-agents.
4. Collect the evidence and return it to the caller.

## Knowledge Sources

| Skill | Use For |
|------|---------|
| `microsoft-docs` | Documentation, tutorials, service overviews, configuration settings, and quotas. |
| `microsoft-code-reference` | API signatures, official code samples, package names, and version-specific SDK details. |

## Routing Rules

- **NEVER GUESS:** If a detail is not in your context, route to `learn`.
- **Prefer `microsoft-docs`** for "how-to" and "what is" questions.
- **Prefer `microsoft-code-reference`** for "how do I code this" or "is this method correct" questions.
- **Merge results:** If both are used, provide a consolidated summary of the evidence found.

## Output

Return:

```text
Knowledge Route:  [microsoft-docs | microsoft-code-reference | both]
Evidence Found:    [Summary of facts/code discovered]
Source URLs:       [Links to official documentation]
Confidence:        [High/Medium/Low based on evidence match]
```
