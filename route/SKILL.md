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

| Skill | Type | Owns |
|------|------|------|
| `route` | routing | entry point, skill selection, graph control, return to facade |
| `microsoft-docs` | knowledge | Microsoft Learn facts, procedures, constraints, and configuration evidence |
| `microsoft-code-reference` | knowledge | official code samples, API signatures, namespaces, packages, and usage patterns |
| `canvas` | action | browser-ready HTML canvases for workflows, structures, and process maps |
| `wpf` | action | WPF implementation with C#, CommunityToolkit.Mvvm, DI, EF Core, and SQLite |

## Routing priority

1. **Need authoritative Microsoft facts first** -> `microsoft-docs`
2. **Need authoritative Microsoft code signatures or examples first** -> `microsoft-code-reference`
3. **Need a visual artifact as the final deliverable** -> `canvas`
4. **Need WPF code or file changes** -> `wpf`

If a task needs facts before action, the knowledge step runs first.

## Common graphs

- `route -> microsoft-docs`
- `route -> microsoft-code-reference`
- `route -> microsoft-docs -> wpf`
- `route -> microsoft-code-reference -> wpf`
- `route -> microsoft-docs -> microsoft-code-reference -> wpf`
- `route -> microsoft-docs -> canvas`

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
