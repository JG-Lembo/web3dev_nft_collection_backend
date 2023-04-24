require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

module.exports = {
  solidity: "0.8.1",
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/aUBF_4iZcTC6vp7vBdNa5f083XEqLhLt",
      accounts: [process.env.MUMBAI_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      polygonMumbai: [process.env.POLYGONSCAN_API_KEY],
    }
  }
};
