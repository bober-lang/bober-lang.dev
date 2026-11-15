# Bober

Bober is a garbage collected, ahead-of-time compiled language that looks almost like TypeScript, made for a fast
build-test loop. Formatter, linter, test runner and language server are all in the one `bober` binary.

Bober is young, and everything here, the language included, will change.
There are packages for Linux x86-64, Linux arm64 and macOS arm64 only.

```bober
function main() { print("Hello Bober!") }
```

```sh
curl -fsSL https://bober-lang.dev/install.sh | sh
bober run hello.bob
```
