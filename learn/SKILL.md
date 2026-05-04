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
    - **Concepts, tutorials, configuration, or limits for Microsoft tech?** -> Route to `microsoft-docs`.
    - **Code samples, API signatures, or SDK usage patterns for Microsoft tech?** -> Route to `microsoft-code-reference`.
    - **Third-party API integration (e.g. PayPal, Twilio) or external SDKs?** -> Route to `integrate-context-matic`.
    - **Onboarding, discovery of APIs, or "how to use" the MCP server?** -> Route to `onboard-context-matic`.
    - **Multiple?** -> Sequence them appropriately.
3. Delegate to the chosen skill(s) via sub-agents.
4. Collect the evidence and return it to the caller.

## Knowledge Sources

| Skill | Use For |
|------|---------|
| `microsoft-docs` | Documentation, tutorials, service overviews, configuration settings, and quotas for Microsoft products. |
| `microsoft-code-reference` | API signatures, official code samples, package names, and version-specific SDK details for Microsoft libraries. |
| `integrate-context-matic` | End-to-end integration guidance, SDK models, and endpoint details for third-party APIs and services. |
| `onboard-context-matic` | Interactive tours, API discovery, and learning how the grounding layer works. |

## Routing Rules

- **NEVER GUESS:** If a detail is not in your context, route to `learn`.
- **Prefer `microsoft-docs`** for Microsoft-specific "how-to" and "what is" questions.
- **Prefer `microsoft-code-reference`** for "how do I code this" or "is this method correct" questions involving Microsoft SDKs.
- **Prefer `onboard-context-matic`** for first-time setup, "what APIs are available?", or tours of the integration capabilities.
- **Prefer `integrate-context-matic`** for any request involving actual third-party API integration (e.g., Stripe, SendGrid, etc.).
- **Merge results:** If multiple sources are used, provide a consolidated summary of the evidence found.

## Output

Return:

```text
Knowledge Route:  [microsoft-docs | microsoft-code-reference | integrate-context-matic | onboard-context-matic | multiple]
Evidence Found:    [Summary of facts/code discovered]
Source URLs:       [Links to official documentation or API references]
Confidence:        [High/Medium/Low based on evidence match]
```
