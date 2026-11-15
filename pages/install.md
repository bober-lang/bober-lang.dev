# Install

```sh
curl -fsSL https://bober-lang.dev/install.sh | sh
```

This puts the newest build for your system in `~/.local/share/bober`, replacing an earlier one, and links it as
`~/.local/bin/bober`. If `~/.local/bin` is not on your `PATH`, it prints the line to add. To install elsewhere, set
`PREFIX`: with `PREFIX=/opt/bober` it uses `/opt/bober/share/bober` and `/opt/bober/bin/bober`.

```sh
curl -fsSL https://bober-lang.dev/install.sh | PREFIX=/opt/bober sh
```

## Update

`bober update` gets the newest build. Now and then bober tells you when one is out; set `TODO(update-env)` to turn
that off. `bober version` prints which build you have.

## Uninstall

```sh
rm -rf ~/.local/share/bober ~/.local/bin/bober
```
