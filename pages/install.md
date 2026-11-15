# Install

```sh
curl -fsSL https://bober-lang.dev/install.sh | sh
```

This puts the newest build for your system in `~/.local/share/bober`, replacing an earlier one, and links it as
`~/.local/bin/bober`. If `~/.local/bin` is not on your `PATH`, it prints the line to add. To install elsewhere, set
`PREFIX`: with `PREFIX=$HOME/opt` it uses `~/opt/share/bober` and `~/opt/bin/bober`.

```sh
curl -fsSL https://bober-lang.dev/install.sh | PREFIX=$HOME/opt sh
```

## Update

`bober update` gets the newest build, and `bober version` prints which one you have. About one run in 32 fetches
`https://dl.bober-lang.dev/edge/version` in the background, sending nothing, and bober then tells you when a newer build
is out. Set `BOBER_NO_UPDATE_CHECK` to turn that off.

## Uninstall

```sh
rm -rf ~/.local/share/bober ~/.local/bin/bober
```
