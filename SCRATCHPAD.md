# Maintenance scratchpad

This is current state for `/maintain`. The skill updates or removes stale
entries on every maintenance cycle and appends one compact history entry.

## Baseline

- Last completed maintenance: **none**. Scaffolded 2026-09-01.
- Delivered upstream base: `f6673a04ccb671b9207da358c57152bfd27c781f`
  (`anomalyco/opentui:main`).
- Audited-upstream frontier: **none**.
- Local integration: `245e2f91fe3bcaa6e1e95e16ada6a11d81152670`.
- Published integration: **none**. The fork has no `integration` branch;
  consumers bind the carry branch and its release tarballs directly.

## Carry heads

- `carry/pixel-mouse-shared-memory` — `245e2f91`, published on the fork.
  Two commits: `468989cf` (Kitty image replacement without blanking) and
  `245e2f91` (shared-memory transmit and pixel-precision mouse).

## Fork namespace

`main` mirrors upstream. No quarantine heads.

## Offers

None open. `468989cf` is an offer candidate — see the follow-up in
`MAINTAIN.md`.

## Notes that can change a later decision

- **Consumer pin skew:** `agentbrowse` pins release `agentbrowse-v0.5.8.2`;
  `agentattention` still pins `agentbrowse-v0.5.8.1` for
  `@opentui/core-darwin-arm64`.
- The `.codex-bun-android-*` FFI-probe stash from the former secondary clone
  is preserved exactly as `stash@{0}` in `~/source/anomalyco--opentui`.
- The gate in `MAINTAIN.md` has never been executed.

## History

- **2026-09-01** — Workshop scaffolded; fork moved from
  `~/src/opentui-possibilities` to `fork/`, remotes repointed to the house
  convention, local `integration` created at the sole carry. No cycle run.
