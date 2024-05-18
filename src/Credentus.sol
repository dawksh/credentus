// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "solmate/tokens/ERC721.sol";

contract Credentus is ERC721 {
    constructor() ERC721("Credentus", "CRD") {}

    error ZeroAddressMint();
    error TransferSoulbound();

    mapping(uint256 => string) internal tokenMetadataMapping;
    uint tokenIds = 0;

    function mintToken(address recipient, string calldata metadata) external {
        if (recipient == address(0)) revert ZeroAddressMint();
        _mint(recipient, tokenIds);
        tokenMetadataMapping[tokenIds++] = metadata;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return tokenMetadataMapping[id];
    }

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public override {
        revert TransferSoulbound();
    }
}
