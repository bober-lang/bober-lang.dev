#!/bin/bash
# build.sh: writes the site to book/: pages/ with the guide and std's reference that bober prints, as HTML and as
# Markdown, llms.txt, llms-full.txt and install.sh. Needs bober and mdbook on PATH.
set -euo pipefail
rm -rf gen book
mkdir gen
cp pages/*.md gen/
bober skill | sed '1,/^---$/d' > gen/guide.md # without its front matter
{ printf '# Standard library\n\n'; bober doc std | sed -E 's|^- `([^`]*)`|- [`\1`](\1.md)|'; } > gen/std.md
mods=$(sed -nE 's|^- \[`([^`]*)`.*|\1|p' gen/std.md)
for m in $mods; do
	mkdir -p "gen/$(dirname "$m")"
	bober doc "$m" > "gen/$m.md"
done
{
	printf '# Summary\n\n[Introduction](introduction.md)\n\n- [Install](install.md)\n- [Guide](guide.md)\n'
	printf -- '- [Standard library](std.md)\n'
	for m in $mods; do echo "  - [$m]($m.md)"; done
	printf -- '- [For agents](agents.md)\n- [Reporting](issues.md)\n'
} > gen/SUMMARY.md
mdbook build
perl -pi -e 's/language-bober/language-typescript/g' $(find book -name '*.html') # highlighted as TypeScript
pages=$(sed -nE 's/.*\]\((.*)\)$/\1/p' gen/SUMMARY.md)
for p in $pages; do
	cp "gen/$p" "book/$p"
	{ cat "gen/$p"; echo; } >> book/llms-full.txt
done
{
	sed -n '/^```/q;3s/^/> /;p' gen/introduction.md
	printf '## Docs\n\n'
	sed -nE 's/^-? ?(\[.*)/- \1/p' gen/SUMMARY.md
	printf '\n## Standard library\n\n'
	grep '^- ' gen/std.md
} > book/llms.txt
cp install.sh book/
