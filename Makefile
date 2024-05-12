-include .env

build :; forge build
tests:; forge test --match-test testOnlyOnwerAccess -vvvv
polygon-deploy:; forge script .\script\DeployFundMe.s.sol --rpc-url $(POLYGON_MAINNET_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(POLYGON_SCAN_API_KEY) -vvvv
# anvil :; forge script .\script\DeployFundMe.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a --broadcast


ethereum-deploy :; forge script .\script\DeployFundMe.s.sol:DeployFundMe --rpc-url $(ETHEREUM_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

