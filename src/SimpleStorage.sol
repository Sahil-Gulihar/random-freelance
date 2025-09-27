// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract The4thMatter {
    string public constant TICKER = "PLASMA";
    string public constant IMAGE_DESCRIPTION =
        "Plasma Ball - The 4th State of Matter";

    // Plasma ball image stored on IPFS
    string public constant PLASMA_IMAGE =
        "ipfs://bafybeiabvu2nzltpxh43qmfafbhuoiwxidpoku2e6a256oiju26xdbrkhi";

    string private storedData;
    address public owner;

    event DataStored(string data, address indexed by);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor(string memory initialData) {
        storedData = initialData;
        owner = msg.sender;
        emit DataStored(initialData, msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function setData(string memory data) public onlyOwner {
        storedData = data;
        emit DataStored(data, msg.sender);
    }

    function getData() public view returns (string memory) {
        return storedData;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    // Function to get the plasma image reference
    function getPlasmaImage() public pure returns (string memory) {
        return PLASMA_IMAGE;
    }

    // Function to get image description
    function getImageDescription() public pure returns (string memory) {
        return IMAGE_DESCRIPTION;
    }
}
