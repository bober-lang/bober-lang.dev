#!/bin/bash
# build.sh: writes the site to site/: pages/ with the guide and std's reference that bober prints, each as Markdown and
# as plain HTML, llms.txt, llms-full.txt and install.sh. Needs bober and cmark-gfm on PATH.
set -euo pipefail
rm -rf site
mkdir site
cp pages/*.md install.sh site/
bober skill | sed '1,/^---$/d' > site/guide.md # without its front matter
{ printf '# Standard library\n\n'; bober doc std | sed -E 's|^- `([^`]*)`|- [`\1`](\1.md)|'; } > site/std.md
mods=$(sed -nE 's|^- \[`([^`]*)`.*|\1|p' site/std.md)
for m in $mods; do
	mkdir -p "site/$(dirname "$m")"
	bober doc "$m" > "site/$m.md"
done
nav='<a href="index.html">Bober</a> | <a href="install.html">Install</a> | <a href="guide.html">Guide</a> |
<a href="std.html">Standard library</a> | <a href="agents.html">For agents</a> | <a href="issues.html">Reporting</a>'
top=$(grep -o '[a-z]*\.html' <<< "$nav" | sed 's/\.html//')
for p in $top $mods; do
	up=$(echo "$p" | sed 's|[^/]*/|../|g; s|[^/]*$||') # from site/$p.html back to site/
	{
		printf '<!doctype html>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width">\n'
		printf '<title>%s</title>\n<p>%s | <a href="https://github.com/bober-lang/bober">GitHub</a></p>\n' "$(sed -n '/^# /{s///p;q}' "site/$p.md")" "${nav//href=\"/href=\"$up}"
		sed 's/\.md)/.html)/g' "site/$p.md" | cmark-gfm -e table
	} > "site/$p.html"
done
for p in $top $mods; do cat "site/$p.md"; echo; done > site/llms-full.txt
{
	sed -n '/^```/q;3s/^/> /;p' site/index.md
	printf '## Docs\n\n'
	grep -o 'href="[^"]*">[^<]*' <<< "$nav" | sed -E 's|href="(.*)\.html">(.*)|- [\2](\1.md)|'
	printf '\n## Standard library\n\n'
	grep '^- ' site/std.md
} > site/llms.txt
