# Reporting

Bugs, performance problems and feature requests are all wanted at <https://github.com/bober-lang/bober/issues>.
Performance problems especially: a slow build, a slow test run or slow generated code is a bug here.

`bober report` prints the issue, with bober's version, your system and the files that show the problem:

```sh
bober report "what happened, and what was expected" small.bob |
    gh issue create -R bober-lang/bober -t "bug: …" -F -
```

The title starts with `bug:`, `slow:` or `wish:`. Without `gh`, paste what it prints at
<https://github.com/bober-lang/bober/issues/new/choose>.
