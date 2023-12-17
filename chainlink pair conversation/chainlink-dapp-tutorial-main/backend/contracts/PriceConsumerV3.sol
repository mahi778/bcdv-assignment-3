// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;
    int public storedPrice;


    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x23TPMx2O7I0EbFuv3R6sN6iK_AnhQ3zg
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0x23TPMx2O7I0EbFuv3R6sN6iK_AnhQ3zg);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }

    function storeLatestPrice() external {
        storedPrice = getLatestPrice();
    }
}