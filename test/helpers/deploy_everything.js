const { ethers } = require("hardhat");

const deployBirdswap = async (feePayout, feeBps) => {
  const [deployer] = await ethers.getSigners();

  const Moonbirds = await ethers.getContractFactory("Moonbirds");
  const moonbirds = await Moonbirds.deploy(
    "MB",
    "Moonbirds",
    deployer.address,
    deployer.address,
    deployer.address,
  );

  await moonbirds.deployed();

  const BirdSwap = await ethers.getContractFactory("BirdSwap");
  const birdswap = await BirdSwap.deploy(moonbirds.address, feePayout, feeBps);
  await birdswap.deployed();

  return [birdswap, moonbirds];
};

module.exports = {
  deployBirdswap
};