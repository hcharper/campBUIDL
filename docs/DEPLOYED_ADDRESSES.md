# Deployed Contract Addresses

All contracts deployed on **Sepolia testnet**.

**Deployer:** `0xEF28Fc165c17Ef3f068B8E1C81d758E11C719Af1`

| Contract | Address | Deployed Via | Date |
|----------|---------|-------------|------|
| Token (HH) | `0x39A9e23297Ea34A6fAEEfd0B0a9c449940b13eB3` | Remix | 2026-02-15 |
| TokenShop | `0x20806C36b38473f6986B4ce2a1214EA6AEc44a56` | Hardhat | 2026-02-15 |
| myNFT | `0xFE33c757Bce94a45d5b2bcAA1616cFc015546181` | Hardhat | 2026-02-15 |

## Etherscan Links

- Token: https://sepolia.etherscan.io/address/0x39A9e23297Ea34A6fAEEfd0B0a9c449940b13eB3
- TokenShop: https://sepolia.etherscan.io/address/0x20806C36b38473f6986B4ce2a1214EA6AEc44a56
- myNFT: https://sepolia.etherscan.io/address/0xFE33c757Bce94a45d5b2bcAA1616cFc015546181
- Deployer: https://sepolia.etherscan.io/address/0xEF28Fc165c17Ef3f068B8E1C81d758E11C719Af1

## Notes

- Token contract uses ERC20 with AccessControl (MINTER_ROLE)
- TokenShop requires the Token address in its constructor and uses Chainlink ETH/USD price feed
- TokenShop has been granted `MINTER_ROLE` on the Token contract (tx: `0xe69c1c8b...`)
- myNFT is a standalone contract with no external dependencies
