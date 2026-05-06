---
name: wpf-implement
description: Invoke to implement a WPF design. This skill writes concrete XAML and C# code based on an approved design, following the prescribed Microsoft stack. It handles ambiguity by consulting the user or routing back to `wpf-design`.
metadata:
  version: "1.1.0"
---

# WPF Implement: Build the Feature

`wpf-implement` transforms a validated design into working code. It owns the creation and modification of project files, ensuring they adhere to idiomatic WPF and MVVM patterns.

## Flow

1. Review the approved design (from `wpf-design`) and the current project state.
2. If any implementation details are unclear or contradictory, STOP and ask the user for clarification.
3. If the user's clarification requires an architectural change, return control to `wpf` to trigger a `wpf-design` step.
4. Execute the implementation:
   - Create/Update XAML Views.
   - Implement ViewModels with `CommunityToolkit.Mvvm`.
   - Implement Services and Interfaces.
   - Register components in the DI container.
   - Configure persistence:
     - **EF Core**: Entities and `DbContext`.
     - **File-based**: Implementation of serialization/deserialization logic (e.g., `System.Text.Json`).
5. Run builds or tests (if available) to verify the implementation.
6. Return the concrete code changes and stop.

## Required Stack

- **UI**: WPF with XAML views
- **Presentation pattern**: MVVM with `CommunityToolkit.Mvvm`
- **Composition**: `Microsoft.Extensions.DependencyInjection`
- **Persistence**: `EntityFrameworkCore` with SQLite or File Serialization (using `System.Text.Json` or `XmlSerializer`)

## Coding Standards

- **Observable Properties**: When using `CommunityToolkit.Mvvm`, always use the C# 13 partial property pattern for observable properties.
  - **Pattern**: `[ObservableProperty] public partial <Type> <PropertyName> { get; set; }`
  - **Example**: `[ObservableProperty] public partial string UserName { get; set; }`
- **Commands**: Use `[RelayCommand]` on methods to generate `ICommand` properties.
- **Dependency Injection**: Register all ViewModels and Services in the project's DI container (usually in `App.xaml.cs`).
- **Persistence**: 
  - For **EF Core**: Use migrations and ensure the `DbContext` is correctly configured for SQLite.
  - For **File Persistence**: Prefer `System.Text.Json` for modern projects. Implement `async` load/save methods and handle file I/O errors gracefully.
- **XAML Binding**: Always use `{Binding ...}` with proper `DataContext` setup (preferring ViewModels injected via DI into the View's constructor/code-behind).

## Hard Rules

- **Follow the Design**: Do not deviate from the approved architecture without user consent.
- **Ambiguity Protocol**: If you are guessing about a design intent, you MUST stop and ask.
- **Idiomatic Code**: Follow standard WPF conventions (e.g., no logic in code-behind, proper data binding, use of `ObservableProperty` and `RelayCommand`).
- **No Inventions**: Do not invent Microsoft APIs or package behaviors. Use official patterns.

## Output

- The concrete code or file changes applied to the project.
- A summary of what was implemented.
