# Review Journal

This journal records the domain cases that matter before widening the public API.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its blockchain tooling focus without claiming live deployment or external usage.

## Cases

- `baseline`: `event finality`, score 178, lane `ship`
- `stress`: `nonce pressure`, score 179, lane `ship`
- `edge`: `settlement risk`, score 225, lane `ship`
- `recovery`: `proof depth`, score 139, lane `watch`
- `stale`: `event finality`, score 247, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
