# Camp BUIDL - ETH Denver

Solidity smart contracts built during ETH Denver Camp BUIDL. Uses Foundry (Forge) for compilation, testing, and deployment.

## Contracts

### HarrisonToken (`HarrisonToken.sol`)
A basic token contract with manual balance tracking. Mints 1000 tokens to the deployer and supports transfers between addresses.

### Token (`Token.sol`)
An ERC20 token ("Harrison Token", ticker HH) with role-based access control. Uses OpenZeppelin's ERC20 and AccessControl. Has a MINTER_ROLE so authorized contracts (like TokenShop) can mint tokens. 2 decimal places.

### TokenShop (`TokenShop.sol`)
A token shop that lets users buy tokens by sending ETH. Uses the Chainlink ETH/USD price feed on Sepolia (`0x694AA1769357215DE4FAC081bf1f309aDC325306`) to calculate how many tokens to mint per transaction. Token price is $2.00 USD.

### myNFT (`NFT.sol`)
A custom NFT contract where each token represents a Polygon (shape with sides and a name). Supports minting (capped at 100), transfers, and attribute updates by the token owner.

## Setup

```bash
# Install Foundry (if not already installed)
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Build contracts
forge build
```

## Deploy to Sepolia

1. Add your MetaMask private key to `.env`:
   ```
   PRIVATE_KEY=your_private_key_here
   ```

2. Deploy Token:
   ```bash
   forge script script/DeployToken.s.sol --rpc-url sepolia --broadcast --private-key $PRIVATE_KEY
   ```

3. Copy the deployed token address, add it to `.env`:
   ```
   TOKEN_ADDRESS=0x...
   ```

4. Deploy TokenShop:
   ```bash
   forge script script/DeployTokenShop.s.sol --rpc-url sepolia --broadcast --private-key $PRIVATE_KEY
   ```

5. Grant TokenShop the minter role (set `TOKENSHOP_ADDRESS` in `.env` first):
   ```bash
   forge script script/GrantMinterRole.s.sol --rpc-url sepolia --broadcast --private-key $PRIVATE_KEY
   ```

6. Deploy myNFT:
   ```bash
   forge script script/DeployNFT.s.sol --rpc-url sepolia --broadcast --private-key $PRIVATE_KEY
   ```

## Scaffold-ETH 2

A full-stack dApp development environment lives in `scaffold-eth/`. It includes a Next.js frontend and its own Foundry setup.

```bash
cd scaffold-eth

# Start local chain
yarn chain

# Deploy contracts (in another terminal)
yarn deploy

# Start frontend (in another terminal)
yarn start
```

## Project Structure

```
src/                          - Solidity smart contracts
  HarrisonToken.sol             Basic token with manual balance tracking
  Token.sol                     ERC20 token (OpenZeppelin + AccessControl)
  TokenShop.sol                 Buy tokens with ETH (Chainlink price feed)
  NFT.sol                       Custom NFT contract (Polygon shapes)
script/                       - Foundry deployment scripts
  DeployHarrisonToken.s.sol
  DeployToken.s.sol
  DeployTokenShop.s.sol
  DeployNFT.s.sol
  GrantMinterRole.s.sol
lib/                          - Dependencies (forge-std, OpenZeppelin, Chainlink)
docs/                         - Documentation
  DEPLOYED_ADDRESSES.md         Deployed contract addresses on Sepolia
  BUGFIX_LOG.md                 Bug tracking log
  notes/                        Learning notes from sessions
scaffold-eth/                 - Scaffold-ETH 2 full-stack dApp
  packages/
    foundry/                    Contracts & deploy scripts
    nextjs/                     Next.js frontend
foundry.toml                  - Forge configuration
remappings.txt                - Import path remappings
```

## Network

- **Target network:** Sepolia testnet
- **Chainlink price feed:** ETH/USD on Sepolia
