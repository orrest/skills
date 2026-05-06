---
name: plantuml-setup
description: 'Integrates the PlantUmlClassDiagramGenerator into a .NET project. This skill installs the required NuGet package, configures the .csproj file for Roslyn Source Generation, and adds the necessary assembly attribute to enable automatic .puml generation during builds.'
metadata:
  version: "1.1.0"
---

# PlantUML Setup: Enable Automatic Class Diagrams

This skill configures a .NET project to use the `PlantUmlClassDiagramGenerator` (Roslyn Source Generator version). Once set up, the project will automatically generate PlantUML (.puml) class diagrams in a specified directory during every build.

## Flow

1. **Detect Project**: Identify the target `.csproj` file(s) where diagrams should be enabled.
2. **Install NuGet Package**: Add the `PlantUML.ClsDig.Src.Gen` package to the project.
   - Command: `dotnet add package PlantUML.ClsDig.Src.Gen`
3. **Configure .csproj**: Add the necessary MSBuild properties and items to enable the generator and specify the output directory.
   - Define `GENERATE_PLANTUML` constant.
   - Make `PlantUmlGenerator_OutputDir` visible to the compiler.
   - Set the default output directory (e.g., `$(ProjectDir)GeneratedUML`).
4. **Enable Generation**: Add the `[assembly: PlantUmlClassDiagramGenerator.SourceGenerator.Attributes.PlantUmlDiagram]` attribute to the project.
   - Prefer adding this to a new `Properties\AssemblyInfo.cs` or an existing assembly-level file.
5. **Verify**: Run `dotnet build` and confirm that `.puml` files are generated in the output directory.

## Configuration Template

Add the following to the `<Project>` section of the `.csproj`:

```xml
<PropertyGroup>
  <DefineConstants>$(DefineConstants);GENERATE_PLANTUML</DefineConstants>
</PropertyGroup>

<ItemGroup>
  <CompilerVisibleProperty Include="PlantUmlGenerator_OutputDir" />
</ItemGroup>

<PropertyGroup>
  <PlantUmlGenerator_OutputDir>$(ProjectDir)GeneratedUML</PlantUmlGenerator_OutputDir>
</PropertyGroup>
```

## Attribute Code

```csharp
using PlantUmlClassDiagramGenerator.SourceGenerator.Attributes;

[assembly: PlantUmlDiagram]
```

## Hard Rules

- **Source Generator Only**: Use the Roslyn Source Generator approach (`PlantUML.ClsDig.Src.Gen`) for seamless integration.
- **Output Visibility**: You MUST include the `<CompilerVisibleProperty Include="PlantUmlGenerator_OutputDir" />` item, or the generator will not see the output path.
- **Assembly Attribute**: Generation is opt-in; the `[assembly: PlantUmlDiagram]` attribute is required for global generation in the project.

## Output

- NuGet package installed.
- `.csproj` updated with generator settings.
- Assembly attribute added.
- A summary of the setup and the output location of the `.puml` files.
