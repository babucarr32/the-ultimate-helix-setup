# The Ultimate Helix Setup
![A beautiful image of helix logo added in the ultimate helix  setup project](/images/the-ultimate-helix-setup.png)
### Languages.toml
---
#### Ada Lang
1. Goto the [release](https://github.com/AdaCore/ada_language_server/releases) page download the asset based on your OS. 
2. Move the all the files inside your darwin(if you are using macOS) folder into `/usr/local/bin`

Read more: [ada_language_server](https://github.com/AdaCore/ada_language_server?tab=readme-ov-file#install)

Append `ada-language-server` to your `language-servers`

languages.toml
```.toml 
[language-server.ada-language-server]
command = "ada-language-server"

[[language]]
name = "ada"
scope = "source.ada"
injection-regex = "ada"
file-types = ["adb", "ads"]
roots = ["alire.toml"]
comment-token = "--"
indent = { tab-width = 3, unit = "   " }
language-servers = ["ada-language-server"]
```
---

#### Ada Lang GPR
1. Goto the [release](https://github.com/AdaCore/ada_language_server/releases) page download the asset based on your OS. 
2. Move the all the files inside your darwin(if you are using macOS) folder into `/usr/local/bin`

Read more: [ada_language_server](https://github.com/AdaCore/ada_language_server?tab=readme-ov-file#install)

Append `ada-gpr-language-server` to your `language-servers`

languages.toml
```.toml 
[language-server.ada-gpr-language-server]
command = "ada-language-server"
args = ["--language-gpr"]

[[language]]
name = "gpr"
scope = "source.gpr"
injection-regex = "gpr"
file-types = ["gpr"]
roots = ["alire.toml"]
comment-token = "--"
indent = { tab-width = 3, unit = "   " }
language-servers = ["ada-gpr-language-server"]
```
---

#### Bash
Installation: 

`npm i -g bash-language-server`

Or

`dnf install -y nodejs-bash-language-server`

Or

`sudo snap install bash-language-server --classic`

To verify that everything is working

`bash-language-server --help`

Read more: [bash-language-server](https://github.com/bash-lsp/bash-language-server)

Append `bash-language-server` to your `language-servers`

languages.toml
```.toml 
[[language]]
name = "bash"
scope = "source.bash"
injection-regex = "(shell|bash|zsh|sh)"
file-types = [
  "sh",
  "bash",
  "ash",
  "dash",
  "ksh",
  "mksh",
  "zsh",
  "zshenv",
  "zlogin",
  "zlogout",
  "zprofile",
  "zshrc",
  "eclass",
  "ebuild",
  "bazelrc",
  "Renviron",
  "zsh-theme",
  "cshrc",
  "tcshrc",
  "bashrc_Apple_Terminal",
  "zshrc_Apple_Terminal",
  { glob = "i3/config" },
  { glob = "sway/config" },
  { glob = "tmux.conf" },
  { glob = ".bash_history" },
  { glob = ".bash_login" },
  { glob = ".bash_logout" },
  { glob = ".bash_profile" },
  { glob = ".bashrc" },
  { glob = ".profile" },
  { glob = ".zshenv" },
  { glob = ".zlogin" },
  { glob = ".zlogout" },
  { glob = ".zprofile" },
  { glob = ".zshrc" },
  { glob = ".zimrc" },
  { glob = "APKBUILD" },
  { glob = ".bash_aliases" },
  { glob = ".Renviron" },
  { glob = ".xprofile" },
  { glob = ".xsession" },
  { glob = ".xsessionrc" },
  { glob = ".yashrc" },
  { glob = ".yash_profile" },
  { glob = ".hushlogin" },
]
shebangs = ["sh", "bash", "dash", "zsh"]
comment-token = "#"
language-servers = [ "bash-language-server" ]
indent = { tab-width = 2, unit = "  " }

```
---

#### ESLint
Installation: 

`npm i -g vscode-langservers-extracted`

Read more:
[vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)

Append `vscogpr-de-eslint-language-server` to your `language-servers`

languages.toml
```.toml
[language-server.eslint]
command = "vscode-eslint-language-server"
args = ["--stdio"]

[language-server.vscode-eslint-language-server.config]
validate = "on"
experimental = { useFlatConfig = false }
rulesCustomizations = []
run = "onType"
problems = { shortenToSingleLine = false }
nodePath = ""

[language-server.vscode-eslint-language-server.config.codeAction.disableRuleComment]
enable = true
location = "separateLine"

[language-server.vscode-eslint-language-server.config.codeAction.showDocumentation]
enable = true

[language-server.vscode-eslint-language-server.config.workingDirectory]
mode = "location"

[[language]]
name = "jsx"
scope = "source.jsx"
injection-regex = "jsx"
language-id = "javascriptreact"
file-types = ["jsx"]
roots = [ "package.json" ]
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "vscode-eslint-language-server" ]
indent = { tab-width = 2, unit = "  " }
grammar = "javascript"
formatter = { command = "dprint", args = [ "fmt", "--stdin", "tsx" ] }
auto-format = true
```

---
#### HTML, CSS, and SCSS
Installation: 

`npm i -g vscode-langservers-extracted`

Read more: [vscode-langserver-extracted](https://www.npmjs.com/package/vscode-languageserver?activeTab=dependents)

Append `vscode-css-language-server` to your `language-servers`

languages.toml
```.toml 
[[language]]
name = "css"
scope = "source.css"
injection-regex = "css"
file-types = ["css", "scss"]
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "vscode-css-language-server" ]
auto-format = true
indent = { tab-width = 2, unit = "  " }

[[grammar]]
name = "css"
source = { git = "https://github.com/tree-sitter/tree-sitter-css", rev = "769203d0f9abe1a9a691ac2b9fe4bb4397a73c51" }

[[language]]
name = "scss"
scope = "source.scss"
injection-regex = "scss"
file-types = ["scss"]
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "vscode-css-language-server" ]
auto-format = true
indent = { tab-width = 2, unit = "  " }

[[grammar]]
name = "scss"
source = { git = "https://github.com/serenadeai/tree-sitter-scss", rev = "c478c6868648eff49eb04a4df90d703dc45b312a" }

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

#### Emmet
Installation: 
```.sh
npm install -g emmet-ls
```

Read more:
[emmet-ls](https://github.com/aca/emmet-ls)

Append `emmet-ls` to your `language-servers`

languages.toml
```.toml
[language-server.emmet-ls]
command = "emmet-ls"
args = [ "--stdio" ]
file-type = ['html', 'tsx', 'jsx', 'css', 'sass']
config = { format = {"output.selfClosingStyle" = "html", "output.inlineBreak" = 0, "markup.href" = false} }

[[language]]
name = "html"
scope = "source.html"
injection-regex = "html"
file-types = ["html", "htm", "shtml", "xhtml", "xht", "jsp", "asp", "aspx", "jshtm", "volt", "rhtml", "cshtml"]
block-comment-tokens = { start = "<!--", end = "-->" }
language-servers = ["emmet-ls"]
auto-format = true
indent = { tab-width = 2, unit = "  " }
```

---

#### Kotlin
Requirements:
1. Java 11+ should be installed and located under JAVA_HOME or PATH.
2. Note that you might need to use `gradlew` instead of `./gradlew` for the commands on Windows.

Installation: 
`git clone git@github.com:fwcd/kotlin-language-server.git`
`cd kotlin-language-server`

To build the lsp run the command below.

`./gradlew :server:installDist`

The language server executable is now located under server/build/install/server/bin/kotlin-language-server. (Depending on your language client, you might want to add it to your PATH)

Note that there are external dependent libraries, so if you want to put the server somewhere else, you have to move the entire install-directory.

Read more: [kotlin-language-server](https://github.com/fwcd/kotlin-language-server)

Append `kotlin-language-server` to your `language-servers`

languages.toml
```.toml 
[language-server.kotlin-language-server]
command = "kotlin-language-server"

[[language]]
name = "kotlin"
scope = "source.kotlin"
file-types = ["kt", "kts"]
roots = ["settings.gradle", "settings.gradle.kts"]
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
indent = { tab-width = 4, unit = "    " }
language-servers = [ "kotlin-language-server" ]

[[grammar]]
name = "kotlin"
source = { git = "https://github.com/fwcd/tree-sitter-kotlin", rev = "c4ddea359a7ff4d92360b2efcd6cfce5dc25afe6" }
```

---

#### TypeScript, and TSX
Installation: 

`npm install -g typescript-language-server typescript`

Read more: [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)

Append `typescript-language-server` to your `language-servers`

languages.toml
```.toml
[[language]]
name = "typescript"
scope = "source.ts"
injection-regex = "(ts|typescript)"
language-id = "typescript"
file-types = ["ts", "mts", "cts"]
shebangs = ["deno", "bun", "ts-node"]
roots = [ "package.json", "tsconfig.json" ]
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "typescript-language-server" ]
indent = { tab-width = 2, unit = "  " }
auto-format = true

[[language]]
name = "tsx"
scope = "source.tsx"
injection-regex = "(tsx)" # |typescript
language-id = "typescriptreact"
file-types = ["tsx"]
roots = [ "package.json", "tsconfig.json" ]
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "typescript-language-server" ]
indent = { tab-width = 2, unit = "  " }
auto-format = true

[[grammar]]
name = "tsx"
source = { git = "https://github.com/tree-sitter/tree-sitter-typescript", rev = "b1bf4825d9eaa0f3bdeb1e52f099533328acfbdf", subpath = "tsx" }
```

---

#### Vale
Installation: 

`brew install vale`

Download and install the latest release of `vale-ls` from [here](https://github.com/errata-ai/vale-ls/releases)

Read more:
[vale](https://vale.sh)
[vale-ls](https://github.com/errata-ai/vale-ls)

Append `vale-ls` to your `language-servers`

languages.toml
```.toml
[language-server.vale-ls]
command = "vale-ls"

[[language]]
name = "markdown"
language-servers = ["vale-ls"]
```

#### Additional configuration
Use one of these styles from [here](https://github.com/errata-ai/packages?tab=readme-ov-file).
I am using the Google style in this example.

Create `.vale.ini` file in the root of your project with the following configurations.

```.ini
StylesPath = .
MinAlertLevel = suggestion

# To reference your custom keywords
# Vocab = MyCustomKeywords

Packages = Google

[*]
BasedOnStyles = Vale, Google

# To Disbale some configs
# Google.Parens = No
# Google.Ellipses = No
# Google.Quotes = No
# Google.Units = No
# Google.Ordinal = No
# Google.AMPM = No
# Google.Spacing = No

# File formats to use
# [formats]
# tsx = mdx
```

---

#### JSON, JSON5, and JSONC
Installation: 

`npm i -g vscode-langservers-extracted`

Read more:
[vscode-langserver-extracted](https://www.npmjs.com/package/vscode-languageserver?activeTab=dependents)
[vscode-json-language-server](https://github.com/microsoft/vscode-json-languageservice)

Append `vscode-json-language-server` to your `language-servers`

languages.toml
```.toml
[[language]]
name = "json"
scope = "source.json"
injection-regex = "json"
file-types = [
  "json",
  "arb",
  "ipynb",
  "geojson",
  "gltf",
  "webmanifest",
  { glob = "flake.lock" },
  { glob = ".babelrc" },
  { glob = ".bowerrc" },
  { glob = ".jscrc" },
  "js.map",
  "ts.map",
  "css.map",
  { glob = ".jslintrc" },
  "jsonl",
  "jsonld",
  { glob = ".vuerc" },
  { glob = "composer.lock" },
  { glob = ".watchmanconfig" },
  "avsc",
  "ldtk",
  "ldtkl",
  { glob = ".swift-format" },
]
language-servers = [ "vscode-json-language-server" ]
indent = { tab-width = 2, unit = "  " }
auto-format = true

[[grammar]]
name = "json"
source = { git = "https://github.com/tree-sitter/tree-sitter-json", rev = "73076754005a460947cafe8e03a8cf5fa4fa2938" }

[[language]]
name = "jsonc"
scope = "source.json"
injection-regex = "jsonc"
file-types = ["jsonc", { glob = "tsconfig.json" }]
grammar = "json"
language-servers = [ "vscode-json-language-server" ]
auto-format = true
indent = { tab-width = 2, unit = "  " }

[[language]]
name = "json5"
scope = "source.json5"
injection-regex = "json5"
file-types = ["json5"]
language-servers = []
comment-token = "//"
indent = { tab-width = 4, unit = "    " }
# https://json5.org

[[grammar]]
name = "json5"
source = { git = "https://github.com/Joakker/tree-sitter-json5", rev = "c23f7a9b1ee7d45f516496b1e0e4be067264fa0d" }
```

---

#### Python
Installation: 

Install pipx if not available
```.sh
brew install pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
```
Install python-lsp-server
```.sh
pipx install python-lsp-server
pipx inject python-lsp-server python-lsp-ruff
```
Install ruff
```.sh
pipx install ruff
```
Read more:
[pipx](https://pipx.pypa.io/stable/)
[python-lsp-server](https://github.com/python-lsp/python-lsp-server)
[ruff](https://docs.astral.sh/ruff/)
[python-lsp-ruff](https://github.com/python-lsp/python-lsp-ruff)

Append `ruff, jedi, pylsp` to your `language-servers`

languages.toml
```.toml
[language-server.pylsp.config.pylsp]
plugins.ruff.enabled = true
plugins.black.enabled = true

[[language]]
name = "python"
scope = "source.python"
injection-regex = "py(thon)?"
file-types = ["py", "pyi", "py3", "pyw", "ptl", "rpy", "cpy", "ipy", "pyt", { glob = ".python_history" }, { glob = ".pythonstartup" }, { glob = ".pythonrc" }, { glob = "SConstruct" }, { glob = "SConscript" }]
shebangs = ["python"]
roots = ["pyproject.toml", "setup.py", "poetry.lock", "pyrightconfig.json"]
comment-token = "#"
language-servers = ["ruff", "jedi", "pylsp"]
# TODO: pyls needs utf-8 offsets
indent = { tab-width = 4, unit = "    " }

[[grammar]]
name = "python"
source = { git = "https://github.com/tree-sitter/tree-sitter-python", rev = "4bfdd9033a2225cc95032ce77066b7aeca9e2efc" }
```

---

#### TailwindCSS
Installation: 
```.sh
npm i @tailwindcss/language-server
```

Read more:
[tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense)

Append `emmet-ls` to your `language-servers`

languages.toml
```.toml
[language-server.tailwindcss-ls]
command = "tailwindcss-language-server"
args = ["--stdio"]

[[language]]
name = "css"
scope = "source.css"
injection-regex = "css"
file-types = ["css", "scss"]
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "tailwindcss-ls" ]
auto-format = true
indent = { tab-width = 2, unit = "  " }

[[language]]
name = "html"
scope = "source.html"
injection-regex = "html"
file-types = ["html", "htm", "shtml", "xhtml", "xht", "jsp", "asp", "aspx", "jshtm", "volt", "rhtml", "cshtml"]
block-comment-tokens = { start = "<!--", end = "-->" }
language-servers = ["tailwindcss-ls"]
auto-format = true
indent = { tab-width = 2, unit = "  " }

# For JSX
[[language]]
name = "jsx"
scope = "source.jsx"
injection-regex = "jsx"
language-id = "javascriptreact"
file-types = ["jsx"]
roots = [ "package.json" ]
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = ["tailwindcss-ls"]
indent = { tab-width = 2, unit = "  " }
grammar = "javascript"
formatter = { command = "dprint", args = [ "fmt", "--stdin", "tsx" ] }
auto-format = true
````

---

#### Svelte
Installation: 
```.sh
npm i -g svelte-language-server
```

Read more:
[Svelte Languange Server](https://www.npmjs.com/package/svelte-language-server)
[Svelte Languange Tools](https://github.com/sveltejs/language-tools)

Append `svelteserver` to your `language-servers`

languages.toml
```.toml
[language-server.svelteserver]
command = "svelteserver"
args = ["--stdio"]

[language-server.svelteserver.config.configuration.typescript]
inlayHints.parameterTypes.enabled = true
inlayHints.variableTypes.enabled = true
inlayHints.propertyDeclarationTypes.enabled = true
inlayHints.functionLikeReturnTypes.enabled = true
inlayHints.enumMemberValues.enabled = true
inlayHints.parameterNames.enabled = "all"

[language-server.svelteserver.config.configuration.javascript]
inlayHints.parameterTypes.enabled = true
inlayHints.variableTypes.enabled = true
inlayHints.propertyDeclarationTypes.enabled = true
inlayHints.functionLikeReturnTypes.enabled = true
inlayHints.enumMemberValues.enabled = true
inlayHints.parameterNames.enabled = "all"

[[language]]
name = "svelte"
scope = "source.svelte"
injection-regex = "svelte"
file-types = ["svelte"]
indent = { tab-width = 2, unit = "  " }
comment-token = "//"
block-comment-tokens = { start = "/*", end = "*/" }
language-servers = [ "svelteserver" ]

[[grammar]]
name = "svelte"
source = { git = "https://github.com/Himujjal/tree-sitter-svelte", rev = "60ea1d673a1a3eeeb597e098d9ada9ed0c79ef4b" }
```
### Config.toml
```.toml
# Set editor theme
theme = "carbon"

[keys.normal]
# Move line up or down with Ctrl-j or Ctrl-k
C-j = ["extend_to_line_bounds", "delete_selection", "paste_after"]
C-k = ["extend_to_line_bounds", "delete_selection", "move_line_up", "paste_before"]

# For lazygit
C-g = [":new", ":insert-output lazygit", ":buffer-close!", ":redraw"]

# Redraw
C-r = ":redraw"

# Vertical Split
C-v = "vsplit"

# Horizontal Split
C-h = "hsplit"

# Global search
# S-d = ['yank_to_clipboard', 'global_search', ':run-shell-command pbpaste']

# For pasting ipconfig
C-p = [":run-shell-command ifconfig | grep '192' | pbcopy"]

# Disable Arrow keys
up = "no_op"
down = "no_op"
left = "no_op"
right = "no_op"
pageup = "no_op"
pagedown = "no_op"
home = "no_op"
end = "no_op"

[keys.insert]
# Exit insert mode
"A-i" = "normal_mode"

# Disable Arrow keys
up = "no_op"
down = "no_op"
left = "no_op"
right = "no_op"
pageup = "no_op"
pagedown = "no_op"
home = "no_op"
end = "no_op"

[editor]
# Enable Inline dignostics
end-of-line-diagnostics = "hint"
# Disable mouse
mouse = false
# Disable middle click paste
middle-click-paste = false

# Set inline diagnostics severity
[editor.inline-diagnostics]
cursor-line = "error"

# Configure the status line
[editor.statusline]
right = ["total-line-numbers", "diagnostics", "selections", "position", "file-type"]
  
```

### Tools
1. [Lazygit](https://github.com/jesseduffield/lazygit)
2. [Tig](https://github.com/jonas/tig)

## Do you have a configuration that is not included here? Share it with the community 😉.
