# About

Simple R package for project setup, includes templates and quality of life shortcuts. Built from a business analyst perspective that uses R occasionally.

## Objectives

This package addresses several development needs:

1.  **Project Setup**: Quickly create projects with predefined templates.
2.  **Script Creation**: Generate scripts with standardized structure and best practices.
3.  **Client Color Palettes**: Maintain and apply custom color palettes for different clients or projects.
4.  [TBC] **Data Inspection and Cleaning memo**: Reminds of favorite tools for inspecting and cleaning data.
5.  [TBC] **Masking Data:** Generate and manage metadata for dataframes, including anonymized or masked data.

## Project Setup

### Create a project
Initialize a project in your current working directory with `create_project()`.

```r
create_project("2026-10-27")
```

This creates the following structure:

```text
project/
├── README.md          # Project overview with date 
├── data/              # Data 
├── plots/             # Plots
├── scripts/
│   └── script.R       # Starter R script
└── fonts/             # Package fonts
```

The function creates missing folders and files without overwriting existing ones. Set `readme = FALSE` to skip creating a README. 


```r
create_project("2026-10-27", readme = FALSE)
```

### Create a new R script 

Create a `script.R` file in your current working directory using the package's script template.

```r
create_script()
```

This creates the following file:

```text
project/
└── script.R    # Starter R script
```

The function preserves any existing `script.R` file and skips creation if one already exists.

## Client Color Palettes

Colors are stored in a JSON configuration file at `⁠~/.config/r-config/config_colors.json⁠`. The file contains a `clients` object, with each client defining a named set of colors.

``` json
{
  "clients": {
    "client_a": {
      "colors": {
        "primary": "#0055A4",
        "secondary": "#F28E2B",
        "accent": "#59A14F"
      }
    },
    "client_b": {
      "colors": {
        "primary": "#6F4E7C",
        "secondary": "#CCB974",
        "accent": "#64B5CD"
      }
    }
  }
}
```
