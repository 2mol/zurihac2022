# ZuriHac 2022 funtimes

- PR: [Do not use O_NONBLOCK on regular files](https://gitlab.haskell.org/ghc/ghc/-/merge_requests/7986)
- Execution time and memory usage in REPL (cabal repl or ghcid): `:set +s`.
- create a random file with either of these commands:
  - `head -c 1G /dev/urandom > randomfile` (binary)
  - `openssl rand -out randomfile -base64 $(( 2**30 * 3/4 ))`
