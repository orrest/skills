---
name: wpf
description: Invoke when the user wants a WPF application or feature. Acts as the routing facade for WPF-specific tasks, selecting between design and implementation paths. Not for doing specialist work itself.
metadata:
  version: "1.0.0"
---

# WPF: Route WPF Design and Implementation

`wpf` is the routing facade for the WPF sub-system. It translates WPF-related requirements into a path involving design (visual architecture) and implementation (concrete code).

## Flow

1. State the WPF task in one sentence.
2. Select the correct WPF sub-skill based on the task type:
   - If the task involves architectural planning, layout design, or defining system components -> `wpf-design`
   - If the task involves writing concrete code, fixing bugs in existing code, or applying an approved design -> `wpf-implement`
3. If the task is complex, declare the graph (e.g., `wpf-design -> wpf-implement`).
4. Delegate to the chosen sub-skill in a sub-agent.
5. Return the chosen route and the stop point.

## Local skill set

| Skill | Type | Owns |
|------|------|------|
| `wpf-design` | action | Architecture design, layout, and visual confirmation via `canvas` |
| `wpf-implement` | action | Concrete code implementation, DI registration, and EF Core setup |

## Routing priority

1. **Need architectural design or visual confirmation** -> `wpf-design`
2. **Need concrete code changes** -> `wpf-implement`

## Return rule

- Each delegated step runs in a sub-agent.
- When a delegated step finishes, control returns to `wpf` (and then back to the root `route`).
- If `wpf-implement` encounters ambiguity, it may return control to `wpf` to request a `wpf-design` step.

## Hard Rules

- `wpf` owns routing, not specialist execution.
- Always prefer `wpf-design` for new features or significant refactors to ensure visual confirmation.
- Use `wpf-implement` only when the design is clear and approved.

## Output

Return:

```text
Route:            [wpf-design, wpf-implement, or graph]
Why:              [one sentence]
Delegation:       [how sub-agents are used]
Stop at:          [final artifact or confirmation]
```
