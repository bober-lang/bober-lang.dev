# For agents

A model does not know Bober yet. `bober skill` prints the [Guide](guide.md) as a skill for the bober you have:

```sh
mkdir -p .claude/skills/bober && bober skill > .claude/skills/bober/SKILL.md
```

TODO(marketplace): the plugin marketplace's install commands.

`bober doc std` lists the standard library's modules, and `bober doc <module>`, e.g. `bober doc std/http/router`,
prints one's reference.

[llms.txt](llms.txt) links the Markdown of each page of this site, and [llms-full.txt](llms-full.txt) is all of it in
one file.
