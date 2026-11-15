# For agents

A model does not know Bober yet. `bober skill` prints the [Guide](guide.md) as a skill, that of the bober you have.
For Claude Code, link the installed one, so that it follows `bober update`:

```sh
mkdir -p ~/.claude/skills && ln -sfn ~/.local/share/bober/skills/bober ~/.claude/skills/bober
```

Or install it as a plugin, which follows bober's repository instead:

```
/plugin marketplace add bober-lang/bober
/plugin install bober@bober
```

For another agent, write it where that one reads its instructions: `bober skill > …`.

`bober doc std` lists the standard library's modules, and `bober doc <module>`, e.g. `bober doc std/http/router`,
prints one's reference. Their sources are in `~/.local/share/bober/std`.

[llms.txt](llms.txt) links the Markdown of each page of this site, and [llms-full.txt](llms-full.txt) is all of it in
one file.
