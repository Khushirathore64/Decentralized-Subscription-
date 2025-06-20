const hre = require("hardhat");

async function main() {
  const SubscriptionService = await hre.ethers.getContractFactory("SubscriptionService");

  // Set initial subscription fee in wei (e.g., 0.01 ETH)
  const subscriptionFee = hre.ethers.utils.parseEther("0.01");

  const contract = await SubscriptionService.deploy(subscriptionFee);
  await contract.deployed();

  console.log("SubscriptionService deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error in deployment:", error);
    process.exit(1);
  });