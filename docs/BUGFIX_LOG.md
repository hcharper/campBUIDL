# Bugfix Log

Track bugs found and fixed so they don't happen again.

---

### BUG-001: Chainlink import path outdated
- **Date:** 2026-02-15
- **File:** `contracts/TokenFactory.sol`
- **Problem:** Import `@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol` fails with newer `@chainlink/contracts` package (v1.5+).
- **Fix:** Updated path to `@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol` (Chainlink moved the interface to a `shared` subdirectory).
- **Lesson:** Chainlink reorganized their contract structure. Always check `node_modules/@chainlink` for actual paths when imports fail.

---

### BUG-002: Sepolia public RPC timeout
- **Date:** 2026-02-15
- **File:** `.env`
- **Problem:** `https://rpc.sepolia.org` timed out with `UND_ERR_HEADERS_TIMEOUT` during deployment.
- **Fix:** Switched RPC to `https://ethereum-sepolia-rpc.publicnode.com`.
- **Lesson:** The default Sepolia RPC is unreliable. Use publicnode, Alchemy, or Infura instead.

---

<!-- Template for new entries:

### BUG-XXX: Short description
- **Date:** YYYY-MM-DD
- **File:** `path/to/file`
- **Problem:** What went wrong.
- **Fix:** What was changed.
- **Lesson:** What to watch out for next time.

-->
