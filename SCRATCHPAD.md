# Maintenance scratchpad

This is current state for `/maintain`. The skill updates or removes stale
entries on every maintenance cycle and appends one compact history entry.

## Baseline

- Last completed maintenance: **2026-09-04**.
- Delivered upstream base: `7581976f4d2c917fd5ae5266c8bc61f0e44fc933`
  (`anomalyco/opentui:main`).
- Audited-upstream frontier: `7581976f4d2c917fd5ae5266c8bc61f0e44fc933`.
- Local integration: `f7a4d536823f47b15ccc52adf5580988b802c69f`.
- Published integration: `f7a4d536823f47b15ccc52adf5580988b802c69f`.

## Carry heads

- `carry/pixel-mouse-shared-memory` — `f7a4d536`, published on the fork.
  Two commits: `24b01599` (Kitty image replacement without blanking) and
  `f7a4d536` (shared-memory transmit, pixel-precision mouse, and upstream
  Kitty transport-status integration).

## Fork namespace

`main` mirrors upstream. No quarantine heads.

## Offers

None open. `24b01599` is an offer candidate — see the follow-up in
`MAINTAIN.md`.

## Notes that can change a later decision

- `agentbrowse`, `smolmux`, and `agentattention` pin both OpenTUI packages to
  release `agentbrowse-v0.5.10.1`.
- OpenTUI commits `189f1007` and `a7fb4ec7`, first released in 0.5.9, keep
  Ghostty `std.log` output off a renderer's stderr. This fixes the observed
  `info(page_list): adjusting page capacity` screen corruption in smolmux;
  no downstream logging carry exists or is needed.
- The `.codex-bun-android-*` FFI-probe stash from the former secondary clone
  is preserved exactly as `stash@{0}` in `~/source/anomalyco--opentui`.
- The full gate in `MAINTAIN.md` passed at `f7a4d536`.

## History

- **2026-09-01** — Workshop scaffolded; fork moved from
  `~/src/opentui-possibilities` to `fork/`, remotes repointed to the house
  convention, local `integration` created at the sole carry. No cycle run.
- **2026-09-04** — Audited upstream `f6673a04..7581976f`, rebased both carries,
  fixed the review-found stale Kitty transport status after successful shared
  memory, passed the complete gate, atomically published mirror/carry/first
  Integration, released `agentbrowse-v0.5.10.1`, and converged agentbrowse,
  smolmux, and agentattention. The smolmux regression deterministically
  reproduces the old `page_list` stderr leak and proves the new artifact silent.
