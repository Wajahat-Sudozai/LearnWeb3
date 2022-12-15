const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {
    const ERC721Contract = await ethers.getContractFactory("CAMAL");
    const deployedERC721Contract = await ERC721Contract.deploy();
    await deployedERC721Contract.deployed();
    console.log("ERC721 Contract Address:", deployedERC721Contract.address);
    console.log("Verify Contract Address:", deployedERC721Contract.address);

    console.log("Sleeping.....");
    await sleep(40000);
  
  // Verify the contract after deploying
  await hre.run("verify:verify", {
    address: deployedERC721Contract.address,
    constructorArguments: [],
  });


    const EncryptionContract = await ethers.getContractFactory("encryption");
    const deployedEncrytionContract = await EncryptionContract.deploy();  
    await deployedEncrytionContract.deployed();
    console.log("Encryption Contract Address:", deployedEncrytionContract.address)
    console.log("Verify Contract Address:", deployedEncrytionContract.address);
    console.log("Sleeping.....");
    await sleep(40000);
    await hre.run("verify:verify", {
    address: deployedEncrytionContract.address,
    constructorArguments: [],
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