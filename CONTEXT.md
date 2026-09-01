# Context

**Workshop** — This repository. It owns the specification, the pin, and the
procedure for one fork; it never contains that fork's source.
_Avoid: wrapper, harness, meta-repo._

**Bound checkout** — The fork's working clone at `fork/`, ignored by this
repository and the only place its branches exist locally.
_Avoid: vendor dir, submodule, copy._

**Fork pin** — `fork.json`: the tracked record of the exact integration,
published-integration, and upstream commits this workshop delivers.
_Avoid: lockfile, manifest, version file._

**Carry** — A `carry/<feature>` branch holding a patch we need and have *not*
contributed upstream. Every carry merges into Integration.
_Avoid: patch branch, feature branch, topic._

**Integration** — The fork's `integration` branch: every carry composed
together, and the only ref a consumer may bind.
_Avoid: release branch, trunk, stable._

**Offer** — A branch shaped for upstream and opened as a pull request. Offers
keep `fix/`–`feat/` names and are never renamed to `carry/`; renaming the
remote branch would close the request.
_Avoid: contribution branch, PR branch._
