// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;
import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/Mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activated;
    struct NetworkConfig {
        address activeChainAddress;
        address secondNeworkAddress;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activated = SepoliaChainLinkConfig();
        } else if (block.chainid == 2) {
            activated = EthereumChainLinkConfig();
        } else {
            activated = AnvilChainLinkConfig();
        }
    }

    function SepoliaChainLinkConfig()
        public
        pure
        returns (NetworkConfig memory)
    {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            activeChainAddress: 0x694AA1769357215DE4FAC081bf1f309aDC325306,
            secondNeworkAddress: address(0)
        });
        return sepoliaConfig;
    }

    function EthereumChainLinkConfig()
        public
        pure
        returns (NetworkConfig memory)
    {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            activeChainAddress: 0x694AA1769357215DE4FAC081bf1f309aDC325306, // something else
            secondNeworkAddress: address(0)
        });
        return sepoliaConfig;
    }

    function AnvilChainLinkConfig() public returns (NetworkConfig memory) {
        vm.startBroadcast();
        MockV3Aggregator mockV3Aggregator = new MockV3Aggregator(8, 2000e8);
        NetworkConfig memory anvilConfig = NetworkConfig({
            activeChainAddress: address(mockV3Aggregator), // something else
            secondNeworkAddress: address(0)
        });
        vm.stopBroadcast();
        return anvilConfig;
    }
}
