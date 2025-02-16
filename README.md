# The Ultimate Helix Setup

### Languages.toml
---
#### HTML
Installation: 

`npm i -g vscode-langservers-extracted`

[vscode-langserver-extracted](https://www.npmjs.com/package/vscode-languageserver?activeTab=dependents)

languages.toml
```.toml 
[[language]]
name = "html"
scope = "source.html"
injection-regex = "html"
file-types = ["html", "htm", "shtml", "xhtml", "xht", "jsp", "asp", "aspx", "jshtm", "volt", "rhtml", "cshtml"]
block-comment-tokens = { start = "<!--", end = "-->" }
language-servers = [ "vscode-html-language-server" ]
auto-format = true
indent = { tab-width = 2, unit = "  " }

[[grammar]]
name = "html"
source = { git = "https://github.com/tree-sitter/tree-sitter-html", rev = "29f53d8f4f2335e61bf6418ab8958dac3282077a" }
```
---
### Config.toml

### Key Bindings

### Tools
