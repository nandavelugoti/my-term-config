# Terminal Configuration
#### Oh My Zsh + Tmux + TPM
A simple linux terminal configuration with Tmux (with Tmux Plugin Manager) and oh-my-zsh.

### Dependencies
- sh (shell)
- curl

### Install
` sh -c "$(curl -fsSL https://github.com/nandavelugoti/my-term-config/install.sh)" `

### Installing plugins
`prefix: Ctrl+A`

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
2. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.

### Uninstalling plugins

1. Remove (or comment out) plugin from the list.
2. Press `prefix` + <kbd>alt</kbd> + <kbd>u</kbd> (lowercase u as in **u**ninstall) to remove the plugin.

All the plugins are installed to `~/.tmux/plugins/` so alternatively you can
find plugin directory there and remove it.

### Key bindings

`prefix` + <kbd>I</kbd>
- Installs new plugins from GitHub or any other git repository
- Refreshes TMUX environment

`prefix` + <kbd>U</kbd>
- updates plugin(s)

`prefix` + <kbd>alt</kbd> + <kbd>u</kbd>
- remove/uninstall plugins not on the plugin list

### More plugins

For more plugins, check [here](https://github.com/tmux-plugins).