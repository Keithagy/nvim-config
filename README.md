# My nvim config

Small, maintainable, unmagical

## Diary

Should set up to take advantage of nvim's caching / lazy-loading features...

### What do I want?
- Nice keybinds (roughly know what I want to add)
- Sensible autocommands (this is ok)
- Clean, minimal theming
- Plugins grouped by functionality
  - Language support
    - rust
    - golang
    - c/cpp
    - python?
    - lua?
  - Notetaking
    - nvim-obsidian
    - markdown render + preview
  - Filenav
    - harpoon
    - telescope / fzf
    - oil
    - neotree
    - netrw!
  - AI
    - avante: cursor-style AI integration
    - supermaven: because I already accidentally paid for a year
  - Search + replace
  - Debugger support

### Task Dump
- set up comfy keybinds
- (re)-modularize config
- configuring language-specific tooling to be amazing
  - rust
  - golang
  - c/cpp
  - markdown
  - python?
  - lua?
  - java?
- Evaluate different ways of traversing / interacting with file system from within nvim
  - harpoon
  - telescope / fzf
  - oil
  - neotree
  - netrw!
- AI capabilities
  - avante: cursor-style AI integration
  - supermaven: because I already accidentally paid for a year
- notetaking
  - obsidian.nvim?
- Can I add a minimal white border around my current active window?
- Can I automate which-key path generation?
  - Currently, which-key "chain" is hardcoded
  - Would it be possible for me to define all keymaps centrally, then build a trie from the keymaps?
  - Functionality potentially already available
- using telescope to familiarize with snippets available for various languages
- incorporate useful configs from lazyvim distro

### More on modularizing config
- Hard to make language configs modular because they touch a lot of things
- Should they have a reference to things like LSP (lspconfig/mason), formatter (conform)..?
