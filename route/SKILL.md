---
name: route
description: Invoke when the user starts from natural language and the local plugin must choose and execute the right skill path. Acts as the routing facade, selects a local worker or graph, and returns after delegated skills finish. Not for doing specialist work itself or skipping evidence when facts are required.
metadata:
  version: "1.0.0"
---

# Route: Route Through the Local Skill Graph

`route` is the facade for this plugin. It translates user intent into the smallest correct local skill path, launches that path with sub-agents, and regains control after each delegated step completes.

## Flow

1. State the job in one sentence.
2. Inventory the local skill set and select the smallest route that can complete the task.
3. If the task depends on facts, choose a knowledge skill before any action skill.
4. If one worker is enough, delegate to that skill in a sub-agent.
5. If multiple steps are required, declare the graph, run each step with sub-agents in order, and return to `route` after each step finishes.
6. Return the chosen route, the evidence path, and the stop point.

## Local skill set

| Category | Skill | Use For |
|----------|-------|---------|
| **Routing** | `route` | Entry point, skill selection, graph control, and return to facade. |
| | `learn` | Knowledge routing, evidence collection, and MCP skill orchestration. |
| | `wpf` | WPF-specific routing facade for design and implementation tasks. |
| **Knowledge** | `microsoft-docs` | Conceptual documentation, tutorials, and limits for Microsoft technologies. |
| | `microsoft-code-reference` | API signatures, official code samples, and SDK details for Microsoft libraries. |
| | `integrate-context-matic` | End-to-end integration guidance for third-party APIs (e.g., Stripe, Twilio). |
| | `onboard-context-matic` | Interactive tours and discovery of available third-party APIs. |
| **Action** | `canvas` | Browser-ready HTML canvases for ANY system visually—software architecture, organizational workflows, data pipelines, or physical processes. |
| | `wpf-design` | Architecture design, layout, and visual confirmation for WPF features. |
| | `wpf-implement` | Concrete C# and XAML code implementation for WPF features. |

## Routing priority

1. **Need facts, signatures, or 3rd-party API info first?** -> `learn`
    - Concepts/Tutorials? -> `learn -> microsoft-docs`
    - API signatures/Code samples? -> `learn -> microsoft-code-reference`
    - 3rd-party integration? -> `learn -> integrate-context-matic`
    - Discovery/Tour of APIs? -> `learn -> onboard-context-matic`
2. **Need a visual artifact (architecture, workflow, map) as the deliverable?** -> `canvas`
3. **Need WPF-specific work?** -> `wpf`
    - New feature/Refactor/UI Design? -> `wpf -> wpf-design`
    - Bug fix/Logic/Implementation? -> `wpf -> wpf-implement`

## Common graphs

- `route -> learn` (Pure inquiry)
- `route -> learn -> wpf` (Grounded WPF task)
- `route -> learn -> canvas` (Grounded visualization)
- `route -> wpf-design -> wpf-implement` (End-to-end WPF feature)
- `route -> learn -> integrate-context-matic` (API integration task)

## Return rule

- Each delegated step runs in a sub-agent.
- When a delegated step finishes, control returns to `route`.
- `route` is the skill that summarizes the chosen route and final stop point.

## Hard Rules

- `route` owns routing, not specialist execution.
- Prefer one worker unless a multi-step graph is materially necessary.
- Do not send action work forward until the required evidence has been collected.
- Keep the graph local to this plugin unless a local skill explicitly hands off elsewhere.

## Output

Return:

```text
Route:            [single skill or graph]
Why:              [one sentence]
Evidence path:    [none or the knowledge step that runs first]
Delegation:       [how sub-agents are used]
Stop at:          [final artifact or evidence bundle]
```
