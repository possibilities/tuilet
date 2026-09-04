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
  `possibilities/opentui`. Both were repointed on 2026-09-01. The exact stash
  from the former secondary clone (`WIP on main`, seven
  `.codex-bun-android-*` FFI probe files) is preserved as `stash@{0}` in
  `~/source/anomalyco--opentui`; the former clone holds no unique stash state.
- Landed means current `anomalyco/opentui:main` satisfies the inventory entry,
  confirmed by reading and exercising that code.

## Branch model

- Mirror branch: `main`, an exact mirror of upstream `main`.
- Integration branch: `integration` — every carry composed together, and the
  only ref a consumer may bind. **Created locally 2026-09-01 and not yet
  published**; the fork had no such branch, and consumers bound the carry
  branch directly.
- Carries: `carry/<feature>`, each merged into Integration.
- Deletion marker prefix: `DELETEME/`. Creating, moving, or removing
  `DELETEME/<original-name>` requires an explicit human decision naming that
  branch. Maintenance never infers deletion from branch age, ownership,
  request state, or namespace. Every undeclared fork head remains unchanged.
- Open pull-request heads: validated. Reconciliation confirms the exact head
  of each currently open request from the fork but does not acquire ownership
  of the ref.
- `scripts/reconcile-branches.sh` is this repository's entrypoint to the
  shared branch script; it declares these values and nothing else.
- Supervision: `scripts/reconcile-branches.sh --configure-supervision`
  converges this model into the bound checkout's own `supervisor.*` git
  config, which is where advisory tools read it — `/tend` judges a worktree
  against Integration and never proposes removing a carry head's worktree.
  `--check-supervision` verifies that convergence and that this section still
  names these branches. The config is derived state, not a second declaration.
- Declared to supervision: `scripts/reconcile-branches.sh
  --configure-supervision` converges `supervisor.checkout` onto **this
  workshop** — one absolute path per bound fork, multi-valued — so a tool that
  discovers the workshop follows it to forks nested anywhere without walking
  the filesystem. It converges `supervisor.carryPrefix` (multi-valued) and
  `supervisor.carryRef` (multi-valued, exact branch names) onto each bound
  checkout. A carry that predates the naming convention is named by ref rather
  than renamed, because renaming a published branch is a publication.

> **A stale check is not a wrong config.** `supervisor.checkout`,
> multi-valued `supervisor.carryPrefix`, and `supervisor.carryRef` were
> converged with the maintain script from `~/code/agentguidance`, which is
> ahead of the rendered copy the entrypoint resolves by default. Until
> agentguidance is rendered and installed, `--check-supervision` with no
> `MAINTAIN_SKILL_DIR` override runs the **old** script against the **new**
> config and fails. That disagreement means the check is stale, never that the
> config is wrong. **Do not re-converge to make it pass**: the old script
> writes single-valued keys and knows nothing of `carryRef` or `checkout`, so
> re-running it would silently destroy the declaration. Verify with
> `MAINTAIN_SKILL_DIR=~/code/agentguidance/skills/maintain` instead.

## Features

Integration carries two commits over upstream, both on
`carry/pixel-mouse-shared-memory`:

| Commit | Subject | Scope |
|---|---|---|
| `468989cf` | fix(native): replace Kitty images without blanking | 8 lines across `renderer.zig` and its test. Reads as a plain upstream defect fix with no agentbrowse coupling. **DECISION — offer upstream?** Assessment deferred at your request; see the follow-up below. |
| `245e2f91` | Carry Kitty shared-memory transmit and pixel-precision mouse | 1,511 lines: POSIX shared-memory Kitty transmit behind an `a=q` probe, DEC 1016 pixel mouse behind a DECRPM fence, signed SGR parsing. Explicitly "for agentbrowse Live View surfaces". Genuinely downstream; not offerable as-is. |

**Follow-up (deferred, on request):** assess whether `468989cf` should be sent
upstream as a pull request, separately from the carry stacked on it.

## Gate

Run verbatim from the candidate worktree:

```sh
bun install
bun run lint:ci
bun run fmt:check
bun run build
bun run test
```

`lint:ci` is `oxlint . --deny-warnings`; `build` compiles the native Zig
sources the carry touches, so it is not optional even when only TypeScript
changed. The carry's own surfaces — `packages/native/src/kitty-shared-memory.zig`,
`terminal.zig`, and the core stdin parser — are covered by that suite.

Publication additionally requires the consumer artifacts: the release tarballs
named in `agentbrowse/config/opentui-carry.json`, whose `sha256` and bun
integrity hashes must match what the consumer pins.

**DECISION — unproven.** Read from `package.json` but not yet executed end to
end. The first cycle must run it and record the result in `SCRATCHPAD.md`.

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
