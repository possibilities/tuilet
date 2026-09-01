# tuilet

The workshop for this machine's
[opentui](https://github.com/anomalyco/opentui) fork: the specification the
fork must satisfy, the state between maintenance cycles, and the script a cycle
calls.

- `MAINTAIN.md` — the specification. The shared `maintain` skill reads it by
  section name and knows nothing about opentui that is not in it.
- `SCRATCHPAD.md` — current state between cycles.
- `scripts/reconcile-branches.sh` — declares the branch model and nothing else.
- `fork.json` — the tracked pin: integration, published integration, upstream.
- `fork/` — the bound checkout, ignored by this repository.
