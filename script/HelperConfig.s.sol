// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;
import {Script} from "forge-std/Script.sol";

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
}
