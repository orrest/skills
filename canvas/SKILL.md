---
name: canvas
description: Invoke when the best deliverable is a browser-ready HTML canvas that explains ANY system visually—software architecture, organizational workflows, data pipelines, or physical processes. This skill abstracts any system into its fundamental elements: inputs, outputs, objects, and their inner relationships.
metadata:
  version: "1.1.0"
---

# Canvas: Universal System Visualization

Use `canvas` when the user would understand the answer better by seeing it. This skill produces a self-contained HTML artifact that represents any system by abstracting it into four fundamental pillars: **Inputs**, **Outputs**, **Objects**, and **Inner Relationships**.

## Flow

1. **Analyze the System**: Deconstruct the user's request into the following four universal elements:
   - **Inputs**: Triggers, data, resources, or commands that enter the system.
   - **Objects**: The core entities, components, modules, actors, or storage units within the system boundary.
   - **Inner Relationships**: How objects interact, depend on each other, or process information (the internal logic/flow).
   - **Outputs**: The final artifacts, state changes, responses, or side effects produced by the system.
2. **Design the Layout**: Organize these elements onto the canvas. By default, follow a logical flow: Inputs (left/top) -> Objects & Relationships (center) -> Outputs (right/bottom).
3. **Reuse the Template**: Use the `references\canvas-template.html` as the foundational visual system.
4. **Produce the Artifact**: Generate the final HTML file and stop.

## File placement

1. Save exported HTML under the current session folder by default.
2. Only write HTML into the repository when the user explicitly names a repository path.
3. Keep the output self-contained so the file can move with the session artifact.

## Theme

1. Use the inline style from `references\canvas-template.html` as the default theme.
2. Keep the output in the same light, presentation-ready family:
   - a very light page background with dark body text
   - white panels with subtle borders, rounded corners, and restrained shadows
   - a blue accent for primary flow labels
   - softer yellow, green, and red accents for warnings, support notes, and exits
3. Reuse the same default component language:
   - `hero` for the page banner
   - `panel` for major content sections
   - `card` for system objects/components
   - `note` for input/output definitions
   - `arrow` for relationships and interactions
   - `callout` for supporting details (parameters, conditions)
4. Keep contrast high enough that labels, notes, and arrows remain readable in screenshots and the browser.

## Required page structure

1. By default, any system visual should contain these parts in this order:
   - **Header banner**: The system title and a concise one-line mission statement.
   - **Main System Canvas**: The primary visual area showing **Objects** and their **Inner Relationships**, often flanked by **Inputs** and **Outputs**.
   - **Supporting details**: Scannable notes for parameters, conditions, caveats, or environmental assumptions.
   - **Element Catalog (formerly Object map)**: A clear breakdown of every major entity (Inputs, Objects, Outputs) and its specific goal or responsibility within the system.
2. Treat this as the default content contract unless the user explicitly asks for a different layout.
3. Keep the **Main System Canvas** as the primary visual focus.

## Hard Rules

- **Abstract Any System**: Do not limit yourself to software; apply this "Input -> Object/Relationship -> Output" model to any domain.
- **Visual Integrity**: Keep the output browser-ready and self-contained.
- **No Scope Creep**: Do not move into broader design or planning once the visual direction is clear.
- **Fact-Based**: Do not invent system behaviors that the provided context does not support.

## Output

- Return only the final HTML artifact or apply the requested HTML file changes.
