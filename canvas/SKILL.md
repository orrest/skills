---
name: canvas
description: Invoke when the best deliverable is a browser-ready HTML canvas that explains a workflow, process, architecture, or object relationships visually. Produces the final HTML artifact using the local canvas template. Not for open-ended planning, prose-only answers, or code implementation.
metadata:
  version: "1.0.0"
---

# Canvas: Materialize the Visual Artifact

Use `canvas` when the user would understand the answer better by seeing it. This skill produces a self-contained HTML artifact and stops at the visual deliverable.

## Flow

1. Confirm that the task is better explained visually than in prose.
2. If the visual depends on facts, require the `learn` skill to gather evidence first.
3. Structure the page around a banner, the main canvas, supporting details, and an object map unless the user asked for a different layout.
4. Reuse the local canvas template as the default visual system.
5. Produce the final HTML file and stop.

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
3. Reuse the same default component language unless the user asks for something else:
   - `hero` for the page banner
   - `panel` for major content sections
   - `card` for sequence steps
   - `note` for inline annotations
   - `arrow` for transitions
   - `callout` for supporting details
4. Keep contrast high enough that labels, notes, and arrows remain readable in screenshots and the browser.

## Required page structure

1. By default, process visuals should contain these parts in this order:
   - **Header banner** with the title and a one-line description
   - **Canvas** that describes the structure, workflow, process, entity relationships, or timeline sequence
   - **Supporting details** for parameters, conditions, caveats, or branch notes
   - **Object map** that names the related objects and states each object's goal
2. Treat this as the default content contract unless the user explicitly asks for a different layout.
3. Keep the **Canvas** as the primary visual focus.
4. Keep supporting details scannable as grouped notes or callouts.
5. Make the object map explicit enough that a reader can understand why each object matters without extra prose.

## Hard Rules

- Keep the output browser-ready and self-contained.
- Do not move into broader design or planning once the visual direction is clear.
- Do not invent process details or system behavior that the sources do not support.
- Keep the canvas as the primary focus of the page.

## Output

- Return only the final HTML artifact or apply the requested HTML file changes.
