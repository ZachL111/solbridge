# Solbridge Walkthrough

I use this file as a small checklist before changing the Solidity implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | event finality | 178 | ship |
| stress | nonce pressure | 179 | ship |
| edge | settlement risk | 225 | ship |
| recovery | proof depth | 139 | watch |
| stale | event finality | 247 | ship |

Start with `stale` and `recovery`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around nonce pressure and proof depth.
