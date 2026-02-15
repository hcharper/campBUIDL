# Camp BUIDL - ETH Denver

Solidity smart contracts built during ETH Denver Camp BUIDL. Uses Foundry (Forge) for compilation, testing, and deployment.

## Contracts

### HarrisonToken (`101Token.sol`)
A basic token contract with manual balance tracking. Mints 1000 tokens to the deployer and supports transfers between addresses.

### Token (`Token.sol`)
An ERC20 token ("Harrison Token", ticker HH) with role-based access control. Uses OpenZeppelin's ERC20 and AccessControl. Has a MINTER_ROLE so authorized contracts (like TokenShop) can mint tokens. 2 decimal places.

### TokenShop (`TokenFactory.sol`)
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

## Project Structure

```
src/             - Solidity smart contracts
script/          - Foundry deployment & interaction scripts
lib/             - Dependencies (forge-std, OpenZeppelin, Chainlink)
docs/
  notes/         - Learning notes from sessions
  DEPLOYED_ADDRESSES.md
  BUGFIX_LOG.md
```

## Network

- **Target network:** Sepolia testnet
- **Chainlink price feed:** ETH/USD on Sepolia
