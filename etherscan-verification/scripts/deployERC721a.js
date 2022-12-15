const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {
    const ERC721AContract = await ethers.getContractFactory("Erc21aBatchMinting");
    const deployedERC721AContract = await ERC721AContract.deploy(500,"https://gateway.pinata.cloud/ipfs/QmR2D5QXeMzhmojWnj6cverGq6WQhwa6gzGbNtfpgRxwgP/");
    await deployedERC721AContract.deployed();
    console.log("ERC721A Contract Address:", deployedERC721AContract.address);
    console.log("Verify Contract Address:", deployedERC721AContract.address);

    console.log("Sleeping.....");
    await sleep(40000);
  
    // Verify the contract after deploying
    await hre.run("verify:verify", {
    address: deployedERC721AContract.address,
    constructorArguments: [500,"https://gateway.pinata.cloud/ipfs/QmR2D5QXeMzhmojWnj6cverGq6WQhwa6gzGbNtfpgRxwgP/"],
    });

  
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });