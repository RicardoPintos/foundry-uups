# Foundry UUPS Upgradeable Contract

This project creates a Universal Upgradeable Smart Contract (UUPS). It was made for the Advanced Foundry course of Cyfrin Updraft.

<br>

- [Foundry UUPS Upgradeable Contract](#foundry-uups-upgradeable-contract)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Libraries](#libraries)
  - [Testing](#testing)
    - [Test Coverage](#test-coverage)
  - [Estimate gas](#estimate-gas)
  - [Formatting](#formatting)
- [Deploy](#deploy)
  - [Private Key Encryption](#private-key-encryption)
  - [Deployment to local Anvil](#deployment-to-local-anvil)
    - [Deploy](#deploy-1)
    - [Upgrade](#upgrade)
    - [Interact](#interact)
  - [Deployment to Sepolia testnet](#deployment-to-sepolia-testnet)
    - [Deploy](#deploy-2)
    - [Upgrade](#upgrade-1)
    - [Interact](#interact-1)
- [Acknowledgments](#acknowledgments)
- [Thank you](#thank-you)

<br>

![EthereumBanner](https://github.com/user-attachments/assets/b8618a81-f8b5-4022-8910-ccd6752f2b15)

<br>

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/RicardoPintos/foundry-uups
cd foundry-uups
forge build
```

<br>

# Usage

## Libraries

This project uses the following libraries:

- [Openzeppelin-contracts](https://github.com/openzeppelin/openzeppelin-contracts)
- [Openzeppelin-contracts-upgradeable](https://github.com/openzeppelin/openzeppelin-contracts-upgradeable)
- [Cyfrin-foundry-devops](https://github.com/Cyfrin/foundry-devops)
- [Foundry-forge-std](https://github.com/foundry-rs/forge-std)

You can install all of them with this Makefile command:

```
make install
```

## Testing

To run every test:

```
forge test
```

You can also perform a **forked test**. If you have an [Alchemy](https://www.alchemy.com) account, you can set up a Sepolia node, add it to your .env file with the flag $SEPOLIA_RPC_URL and run:

```
source .env
forge test --fork-url $(SEPOLIA_RPC_URL)
```

Or run this Makefile command:

```
make fork-test
```

### Test Coverage

To check the test coverage of this project, run:

```
forge coverage
```

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

## Formatting

To run code formatting:

```
forge fmt
```

<br>

# Deploy

## Private Key Encryption

It is recommended to work with encrypted private keys for both Anvil and Sepolia. The following method is an example for Anvil. If you want to deploy to Sepolia, repeat this process with the private key and address of your **test wallet**.

In your local terminal, run this:

```
cast wallet import <Choose_Your_Anvil_Account_Name> --interactive
```

Paste your private key, hit enter and then create a password for that key. 

<br>

Now, you can use the `--account` flag instead of `--private-key`. You'll need to type your password when is needed. To check all of your encrypted keys, run this:

```
cast wallet list
```

## Deployment to local Anvil

### Deploy

First you need to run Anvil on your terminal:

```
anvil
```

Then you open another terminal and run this:

```
forge script script/DeployBox.s.sol:DeployBox --rpc-url http://127.0.0.1:8545 --account <Your_Encrypted_Anvil_Private_Key_Account_Name> --broadcast -vvvv
```

### Upgrade

To upgrade the implementation contract, run this:

```
forge script script/UpgradeBox.s.sol:UpgradeBox --rpc-url http://127.0.0.1:8545 --account <Your_Encrypted_Anvil_Private_Key_Account_Name> --broadcast -vvvv
```

### Interact

To get the number stored on the proxy contract, run this:

```
cast call <Anvil_Proxy_Address> "getNumber()" --rpc-url http://127.0.0.1:8545 -vvvv
```

To change the number stored on the proxy contract, run this:

```
cast send <Anvil_Proxy_Address> "setNumber(uint256)" 77 --rpc-url http://127.0.0.1:8545 --account <Your_Encrypted_Anvil_Private_Key_Account_Name> -vvvv
```

You can get the number again to test if the number was changed.

<br>


## Deployment to Sepolia testnet

### Deploy

To deploy to Sepolia, run this:

```
forge script script/DeployBox.s.sol:DeployBox --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> --broadcast -vvvv
```

If you have an Etherscan API key, you can verify your contract alongside the deployment by running this instead:

```
forge script script/DeployBox.s.sol:DeployBox --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> --broadcast --verify --etherscan-api-key <Your_Etherscan_Api_Key> -vvvv
```

### Upgrade

To upgrade the implementation contract, run this:

```
forge script script/UpgradeBox.s.sol:UpgradeBox --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> --broadcast -vvvv
```

### Interact

To get the number stored on the proxy contract, run this:

```
cast call <Sepolia_Proxy_Address> "getNumber()" --rpc-url <Your_Alchemy_Sepolia_Node_Url>  -vvvv
```

To change the number stored on the proxy contract, run this:

```
cast send <Sepolia_Proxy_Address> "setNumber(uint256)" 77 --rpc-url <Your_Alchemy_Sepolia_Node_Url> --account <Your_Encrypted_Sepolia_Private_Key_Account_Name> -vvvv
```

You can get the number again to test if the number was changed.

<br>

# Acknowledgments

Thanks to the Cyfrin Updraft team and to Patrick Collins for their amazing work. Please check out their courses on [Cyfrin Updraft](https://updraft.cyfrin.io/courses).

<br>

# Thank you

If you appreciated this, feel free to follow me!

[![Ricardo Pintos Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=x&logoColor=white)](https://x.com/pintosric)
[![Ricardo Pintos Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ricardo-mauro-pintos/)
[![Ricardo Pintos YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@PintosRic)