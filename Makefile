-include .env

.PHONY: build test fork install deploy anvil sepolia

install :; forge install foundry-rs/forge-std --no-commit && forge install openzeppelin/openzeppelin-contracts --no-commit && forge install openzeppelin/openzeppelin-contracts-upgradeable --no-commit && forge install cyfrin/foundry-devops --no-commit 

build :; forge build

test :; forge test

fork-test :; forge test --fork-url $(SEPOLIA_RPC_URL) -vvvv

# ANVIL

deploy-anvil:
	@forge script script/DeployBox.s.sol:DeployBox --rpc-url $(LOCAL_RPC_URL) --account anvilKey --broadcast -vvvv

upgrade-anvil:
	@forge script script/UpgradeBox.s.sol:UpgradeBox --rpc-url $(LOCAL_RPC_URL) --account anvilKey --broadcast -vvvv

# SEPOLIA

deploy-sepolia:
	@forge script script/DeployBox.s.sol:DeployBox --rpc-url $(SEPOLIA_RPC_URL) --account testKey --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

upgrade-sepolia:
	@forge script script/UpgradeBox.s.sol:UpgradeBox --rpc-url $(SEPOLIA_RPC_URL) --account testKey --broadcast -vvvv
