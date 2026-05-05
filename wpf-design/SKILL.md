---
name: wpf-design
description: Invoke to design a WPF feature or application. This skill owns architectural planning, layout design, and defining components like Views, ViewModels, Services, DI registration, and EF Core entities. It MUST use the `canvas` skill to present the design for user confirmation.
metadata:
  version: "1.0.0"
---

# WPF Design: Architect the Feature

`wpf-design` is responsible for the blueprint of a WPF feature. It defines how the UI looks and how the underlying components interact, ensuring the user approves the direction before any code is written.

## Flow

1. Analyze the user's WPF requirements to identify the core entities, UI needs, and application logic.
2. Design the comprehensive architecture:
   - **Layout & Controls**: Define the XAML structure and UI elements.
   - **MVVM**: Define Views and their corresponding ViewModels (including properties and commands).
   - **Services**: Define application-level services and their interfaces.
   - **DI**: Define how components will be registered in `Microsoft.Extensions.DependencyInjection`.
   - **Persistence**: Define EF Core entities and the `DbContext` shape.
3. **Visualize with Canvas**: Use the `canvas` skill to create a visual representation of this architecture (e.g., a process flow, component map, or wireframe).
4. **Request Confirmation**: Present the visual design to the user and explicitly ask for confirmation to proceed to implementation.
5. Stop once confirmation is received or if the user requests design changes.

## Required Stack Context

- **UI**: WPF with XAML
- **Pattern**: MVVM (CommunityToolkit.Mvvm)
- **DI**: Microsoft.Extensions.DependencyInjection
- **Persistence**: EF Core with SQLite

## Hard Rules

- **Visual First**: You MUST produce a `canvas` visual for any non-trivial design.
- **Explicit Approval**: You MUST ask the user "Does this design look correct? Shall I proceed to implementation?" before finishing.
- **No Implementation**: Do not write C# or XAML code files in this skill. Focus strictly on the design/blueprint.

## Output

- A summary of the designed architecture.
- The `canvas` HTML artifact.
- An explicit request for user confirmation.
