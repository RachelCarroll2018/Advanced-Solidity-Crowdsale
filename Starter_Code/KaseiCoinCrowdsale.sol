pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint rate,
        address payable wallet,
        KaseiCoin token)
        public Crowdsale(rate, wallet, token) {}}


contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet)
        public {
        // Create a new instance of the KaseiCoin contract.
        // Assign the token contract’s address to the `kasei_token_address` variable.
        // Create a new instance of the `KaseiCoinCrowdsale` contract   
        // Assign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        // Set the `KaseiCoinCrowdsale` contract as a minter
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role

        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kasei_token_address = address(token);
        KaseiCoinCrowdsale kasei_crowdsale = new KaseiCoinCrowdsale(1, wallet, token);
        kasei_crowdsale_address = address(kasei_crowdsale);
        token.addMinter(kasei_crowdsale_address);
        token.renounceMinter();}}