# solbridge

`solbridge` keeps a focused Solidity implementation around blockchain tooling. The project goal is to model bridge accounting, mint-burn limits, and replay protection.

## Purpose

The project exists to keep a narrow engineering decision visible and testable. For this repo, that decision is how event finality and settlement risk should influence a review result.

## Solbridge Review Notes

For a quick review, compare `event finality` with `proof depth` before reading the middle cases.

## What Is Covered

- `fixtures/domain_review.csv` adds cases for event finality and nonce pressure.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/solbridge-walkthrough.md` walks through the case spread.
- The Solidity code includes a review path for `event finality` and `proof depth`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Implementation Notes

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The Solidity checks add a pure review lens and Foundry coverage.

## Command

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Audit Path

The check exercises the source code and the review fixture. `stale` is the high score at 247; `recovery` is the low score at 139.

## Limits

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
