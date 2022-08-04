# Unit 21: Martian Token Crowdsale

## Background

After waiting for years and passing several tests, the Martian Aerospace Agency selected you to become part of the first human colony on Mars. As a prominent fintech professional, they chose you to lead a project developing a monetary system for the new Mars colony. You decided to base this new system on blockchain technology and to define a new cryptocurrency named **KaseiCoin**. (Kasei means Mars in Japanese.)

KaseiCoin will be a fungible token that’s ERC-20 compliant. You’ll launch a crowdsale that will allow people who are moving to Mars to convert their earthling money to KaseiCoin.

The steps for this project are divided into the following subsections:

1. Create the KaseiCoin Token Contract

2. Create the KaseiCoin Crowdsale Contract

3. Create the KaseiCoin Deployer Contract

4. Deploy and Test the Crowdsale on a Local Blockchain

### Step 1: Create the KaseiCoin Token Contract

In order to create a smart contract that defines KaseiCoin as an ERC-20 token, I completed the following steps:

1. Import the provided `KaseiCoin.sol` starter file into the Remix IDE.

2. Import the following contracts from the OpenZeppelin library:

    * `ERC20`

    * `ERC20Detailed`

    * `ERC20Mintable`

3. Define a contract for the KaseiCoin token, and name it `KaseiCoin`. Have the contract inherit the three contracts that you just imported from OpenZeppelin.

4. Inside the `KaseiCoin` contract, add a constructor with the following parameters: `name`, `symbol`, and `initial_supply`.

5. As part of the constructor definition, add a call to the constructor of the `ERC20Detailed` contract, passing the parameters `name`, `symbol`, and `18`. (Recall that 18 is the value for the `decimals` parameter.)

6. Compile the contract by using compiler version 0.5.0.

7. Check for any errors, and debug them as needed.

8. Take a screenshot of the successful compilation of the contract




### Step 2: Create the KaseiCoin Crowdsale Contract

In this subsection, you’ll define the KaseiCoin crowdsale contract. To do so, complete the following steps:

1. Import the provided `KaseiCoinCrowdsale.sol` starter code into the Remix IDE.

2. Have this contract inherit the following OpenZeppelin contracts:

    * `Crowdsale`

    * `MintedCrowdsale`

3. In the `KaisenCoinCrowdsale` constructor, provide parameters for all the features of your crowdsale, such as `rate`, `wallet` (where to deposit the funds that the token raises), and `token`. Configure these parameters as you want for your KaseiCoin token.

4. Compile the contract by using compiler version 0.5.0.

5. Check for any errors, and debug them as needed.

6. Take a screenshot of the successful compilation of the contract, and add it to the Evaluation Evidence section of the `README.md` file for your GitHub repository. <br>
![First compilation ](https://user-images.githubusercontent.com/98990090/182960872-d65f17ec-0a49-4860-965d-cff5bdac5671.png)

### Step 3: Create the KaseiCoin Deployer Contract

In the `KaseiCoinCrowdsaleDeployer` contract, I added variables to store the addresses of the `KaseiCoin` and `KaseiCoinCrowdsale` contracts, which this contract will deploy. Finally, I completed the `KaseiCoinCrowdsaleDeployer` contract by doing the following steps:

1. Create an `address public` variable named `kasei_token_address`, which will store the `KaseiCoin` address once that contract has been deployed.

2. Create an `address public` variable named `kasei_crowdsale_address`, which will store the `KaseiCoinCrowdsale` address once that contract has been deployed.

3. Add the following parameters to the constructor for the `KaseiCoinCrowdsaleDeployer` contract: `name`, `symbol`, and `wallet`.

4. Inside of the constructor body (that is, between the braces), complete the following steps:

    * Create a new instance of the `KaseiCoinToken` contract.

    * Assign the address of the KaseiCoin token contract to the `kasei_token_address` variable. (This will allow you to easily fetch the token's address later.)

    * Create a new instance of the `KaseiCoinCrowdsale` contract by using the following parameters:

      * The `rate` parameter: Set `rate` equal to 1 to maintain parity with ether.

      * The `wallet` parameter: Pass in `wallet` from the main constructor. This is the wallet that will get paid all the ether that the crowdsale contract raises.

      * The `token` parameter: Make this the `token` variable where `KaseiCoin` is stored.

    * Assign the address of the KaseiCoin crowdsale contract to the `kasei_crowdsale_address` variable. (This will allow you to easily fetch the crowdsale’s address later.)

    * Set the `KaseiCoinCrowdsale` contract as a minter.

    * Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.

5. Compile the contract by using compiler version 0.5.0.

6. Check for any errors, and debug them as needed.

7. Take a screenshot of the successful compilation of the contract <br>
![second compilation](https://user-images.githubusercontent.com/9899090/182960876-179fcb5b-15f3-4e34-8ccf-b2734b3da7d6.png)

### Step 4: Deploy and Test the Crowdsale on a Local Blockchain

In this subsection, you'll deployed the crowdsale to a local blockchain. You’ll then perform a real-world, preproduction test of your crowdsale. To do so, complete the following steps:

1. Deploy the crowdsale to a local blockchain by using Remix, MetaMask, and Ganache.

2. Test the functionality of the crowdsale by using test accounts to buy new tokens and then checking the balances of those accounts.

3. Review the total supply of minted tokens and the amount of wei that the crowdsale contract has raised.
![deployment](https://user-images.githubusercontent.com/98990090/182960883-f7d460eb-b530-45fe-8cbf-8aff809d0dd3.png) <br> Initial deployment
![mint 100000](https://user-images.githubusercontent.com/98990090/182960875-0dbab9d6-6b5c-4fdd-88d6-81e05f950f4f.png)<br> Minting tokens
![transferring ](https://user-images.githubusercontent.com/98990090/182960880-fe3a44a2-d308-4282-9f54-f49861b18b69.png) <br> Transferring tokens
![add minter](https://user-images.githubusercontent.com/98990090/182960881-e846d269-b68b-413c-9424-6e10e4c479ba.png) <br> Making another person a minter
![balance of account](https://user-images.githubusercontent.com/98990090/182960882-bdfd70fd-4cc8-4627-8975-b64eb46781c5.png) <br> Checking balance of account
