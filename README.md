# orrest-skills

This repository is a GitHub Copilot CLI plugin built around a routing / knowledge / action architecture.

## Architecture

| Layer | Skill | Responsibility |
|------|-------|----------------|
| Routing | `go` | The user-facing facade that knows the local skill set, selects the right worker or graph, delegates work to sub-agents, and returns after each delegated step finishes. |
| Knowledge | `microsoft-docs` | Collects official Microsoft documentation evidence before downstream action. |
| Knowledge | `microsoft-code-reference` | Collects official Microsoft code samples, API references, and signature-level evidence before downstream action. |
| Action | `canvas` | Produces browser-ready HTML canvases for flows, process maps, and structured visual explanations. |
| Action | `wpf` | Produces WPF application work with C#, CommunityToolkit.Mvvm, Microsoft.Extensions.DependencyInjection, EF Core, and SQLite. |

The architecture keeps `go` as the facade, makes evidence collection explicit, and treats action skills as focused executors.

## Included skills

- `go`
- `canvas`
- `wpf`
- `microsoft-docs`
- `microsoft-code-reference`

## Usage

Prefer `go` as the entry point when the route is not already obvious. It can:

1. choose a single local worker skill;
2. define a multi-step graph when knowledge must come before action;
3. return to the routing layer after each delegated sub-agent completes.

Direct invocation is still valid when the target skill is already clear.
