# opentui fork maintenance

This repository delivers and maintains our fork of
[`anomalyco/opentui`](https://github.com/anomalyco/opentui): the terminal
renderer agentbrowse draws its Live View through. `/maintain` runs a
maintenance cycle from this file; this file is the whole of what that skill
knows about opentui.

> **Draft.** Scaffolded 2026-09-01 from the observed state of the fork. Lines
> marked **DECISION** are yours to settle before the first cycle runs.

## Purpose

Keep a published `integration` branch carrying the terminal capabilities
agentbrowse needs before — or instead of — upstream shipping them, rebuilt on
current upstream every cycle, and consumed through published release tarballs.

## Upstream

- Bound checkout: `fork/`. `origin` is `anomalyco/opentui`; `fork` is
  `possibilities/opentui`. Both were repointed on 2026-09-01: `origin`
  previously addressed a second local clone at `~/src/opentui`, which the
  single-copy rule retires.
- Landed means current `anomalyco/opentui:main` satisfies the inventory entry,
  confirmed by reading and exercising that code.

## Branch model

- Mirror branch: `main`, an exact mirror of upstream `main`.
- Integration branch: `integration` — every carry composed together, and the
  only ref a consumer may bind. **Created locally 2026-09-01 and not yet
  published**; the fork had no such branch, and consumers bound the carry
  branch directly.
- Carries: `carry/<feature>`, each merged into Integration.

## Features

Integration carries two commits over upstream, both on
`carry/pixel-mouse-shared-memory`:

| Commit | Subject | Scope |
|---|---|---|
| `468989cf` | fix(native): replace Kitty images without blanking | 8 lines across `renderer.zig` and its test. Reads as a plain upstream defect fix with no agentbrowse coupling. **DECISION — offer upstream?** Assessment deferred at your request; see the follow-up below. |
| `245e2f91` | Carry Kitty shared-memory transmit and pixel-precision mouse | 1,511 lines: POSIX shared-memory Kitty transmit behind an `a=q` probe, DEC 1016 pixel mouse behind a DECRPM fence, signed SGR parsing. Explicitly "for agentbrowse Live View surfaces". Genuinely downstream; not offerable as-is. |

**Follow-up (deferred, on request):** assess whether `468989cf` should be sent
upstream as a pull request, separately from the carry stacked on it.

## Consumer

agentbrowse, through GitHub release tarballs rather than a git ref:
`agentbrowse/config/opentui-carry.json` records the carry commit, the release
tag, and per-package `sha256` and bun integrity hashes; `agentbrowse`'s
`package.json` resolves `@opentui/core` and `@opentui/core-darwin-arm64` to
those assets.

**DECISION — a live pin skew.** `agentbrowse` pins release
`agentbrowse-v0.5.8.2` for both packages; `agentattention` still pins
`agentbrowse-v0.5.8.1` for `@opentui/core-darwin-arm64`. Same upstream 0.5.8,
two different carry builds in one dependency graph. The first cycle should
converge them.

## Notify

- Title: `opentui Maintenance`
- Group: `tuilet.maintain`
