const hre = require("hardhat");

async function main() {
  console.log("Deploying HarrisonToken...");

  const HarrisonToken = await hre.ethers.getContractFactory("HarrisonToken");
  const token = await HarrisonToken.deploy();
  await token.waitForDeployment();

  const address = await token.getAddress();
  console.log("HarrisonToken deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
