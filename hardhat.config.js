require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

module.exports = {
  solidity: "0.8.1",
  networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/fOfhULzCAGh_afiEKYVQa6pUm5AWtbGf",
      accounts: [process.env.SEPOLIA_PRIVATE_KEY],
    },
  },
};
