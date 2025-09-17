## VSOI Wegest
Written in elixir.  prefer live view pages.  use the deifnitions in AGENTS.md to drive elixir config

please create new tests for any code generated

## Component Architecture
- Headers and footers are defined in `lib/vsoi_web/components/core_components.ex` for maintainability
- Main header: `appheader` component (line 158)
- Footer: `footer` component (line 117)
- Navigation header: `nav_header` component (line 815) for pages without app layout
- Always keep layout components centralized in core_components.ex
