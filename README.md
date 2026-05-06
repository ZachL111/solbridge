# solbridge

`solbridge` explores blockchain tooling in Solidity. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Solbridge Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Why This Exists

I use this kind of project to make a rule visible before adding more machinery around it. The important part here is not the size of the codebase. It is that the input signals, scoring rule, fixture data, and expected output can all be checked in one sitting.

## Example Scenarios

`degraded` is the first example I would inspect because it lands on the `review` path with a score of -93. The broader file also keeps `degraded` at -93 and `surge` at 148, which gives the model a useful low-to-high spread.

## Implementation Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps contract state, event replay, and invariant checks in one explicit decision path. The threshold is 180, with risk penalty 7, latency penalty 4, and weight bonus 4. The Solidity project uses Foundry tests and pure contract functions so invariants are cheap to exercise.

## Feature Notes

- Models contract state with deterministic scoring and explicit review decisions.
- Uses fixture data to keep event replay changes visible in code review.
- Includes extended examples for invariant checks, including `surge` and `degraded`.
- Documents settlement rules tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Code Tour

- `src`: primary implementation
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands
- `foundry.toml`: Foundry project configuration

## Roadmap

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more blockchain tooling fixture that focuses on a malformed or borderline input.

## Boundaries

The repository favors determinism over breadth. It does not pull live data, keep secrets, or depend on network access for verification.

## Local Setup

Clone the repository, enter the directory, and run the verifier. No database server, cloud account, or token is required.
