---
name: wpf
description: Invoke when the user wants a WPF application or feature implemented with C#, CommunityToolkit.Mvvm, Microsoft.Extensions.DependencyInjection, EF Core, and SQLite local storage. Produces concrete code or file changes in a single worker flow and may reuse local templates or scripts when available. Not for guessing framework details, broad product design, or skipping evidence when Microsoft facts are required.
metadata:
  version: "1.0.0"
---

# WPF: Build the Desktop App Work

Use `wpf` for implementation work on a WPF application that follows the prescribed Microsoft stack. This skill owns the coherent code path and stops at the concrete project artifact.

## Flow

1. Restate the requested WPF deliverable and the files or project surface it will touch.
2. If framework behavior, package usage, or API details are unclear, invoke `learn` first and keep that evidence available.
3. Shape the work around the stack profile: WPF views, MVVM view models, DI registration, EF Core persistence, and SQLite local storage.
4. Execute the implementation in a single worker flow, reusing local templates or scripts when they already exist.
5. Return the concrete code or file changes and stop.

## Required stack

- **UI**: WPF with XAML views
- **Presentation pattern**: MVVM with `CommunityToolkit.Mvvm`
- **Composition**: `Microsoft.Extensions.DependencyInjection`
- **Persistence**: `EntityFrameworkCore` with SQLite for local storage

## Default implementation shape

1. Views stay focused on presentation and binding.
2. View models own commands, state, and coordination logic.
3. Services own application behavior and external boundaries.
4. `DbContext` and entities own persistence shape.
5. DI registration wires the application composition root.

## Preferred hand-offs

- Use `learn` when the task depends on official framework behavior, configuration, platform guidance, or exact namespaces, APIs, sample patterns, and package usage.

## Hard Rules

- Keep business logic out of WPF code-behind.
- Avoid hidden singletons used as service locators
- Avoid undocumented guesses about Microsoft package behavior
- Use CommunityToolkit.Mvvm for view-model state and commands unless the user explicitly says otherwise.
- Register application services through Microsoft.Extensions.DependencyInjection rather than a service locator pattern.
- Treat SQLite as local persistence behind EF Core, not ad-hoc file access.
- Do not invent Microsoft APIs, namespaces, or package usage without evidence.

## Output

- Return only the concrete code artifact or apply the requested file changes.
