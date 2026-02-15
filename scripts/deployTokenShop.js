const hre = require("hardhat");

async function main() {
  // IMPORTANT: Replace this with the deployed HarrisonToken address
  const TOKEN_ADDRESS = process.env.TOKEN_ADDRESS;

  if (!TOKEN_ADDRESS) {
    throw new Error(
      "Set TOKEN_ADDRESS in your .env file to the deployed HarrisonToken address"
    );
  }

  console.log("Deploying TokenShop with token address:", TOKEN_ADDRESS);

  const TokenShop = await hre.ethers.getContractFactory("TokenShop");
  const shop = await TokenShop.deploy(TOKEN_ADDRESS);
  await shop.waitForDeployment();

  const address = await shop.getAddress();
  console.log("TokenShop deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
