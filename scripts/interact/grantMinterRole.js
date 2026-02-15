const hre = require("hardhat");

async function main() {
  const TOKEN_ADDRESS = process.env.TOKEN_ADDRESS;
  const TOKENSHOP_ADDRESS = "0x20806C36b38473f6986B4ce2a1214EA6AEc44a56";

  if (!TOKEN_ADDRESS) {
    throw new Error("Set TOKEN_ADDRESS in your .env file");
  }

  const token = await hre.ethers.getContractAt("Token", TOKEN_ADDRESS);
  const MINTER_ROLE = await token.MINTER_ROLE();

  // Check if already granted
  const alreadyHasRole = await token.hasRole(MINTER_ROLE, TOKENSHOP_ADDRESS);
  if (alreadyHasRole) {
    console.log("TokenShop already has MINTER_ROLE, nothing to do.");
    return;
  }

  console.log("Granting MINTER_ROLE to TokenShop...");
  console.log("  Token:", TOKEN_ADDRESS);
  console.log("  TokenShop:", TOKENSHOP_ADDRESS);

  const tx = await token.grantRole(MINTER_ROLE, TOKENSHOP_ADDRESS);
  await tx.wait();

  console.log("MINTER_ROLE granted! Tx hash:", tx.hash);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
