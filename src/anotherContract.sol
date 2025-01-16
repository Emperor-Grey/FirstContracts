// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

// This code is not written by me, it is taken from the Chatgpt which took from the solidity docs
contract Owner {
    address public owner;

    constructor() {
        owner = msg.sender; // owner is me !
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        // Now we Continue with code
        _; // this tells to continue with the code
    }

    modifier costs(uint _price) {
        require(
            msg.value >= _price,
            "Not enough Ether provided, please check the price"
        );
        _;
    }
}

// This is the code that i wrote
contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    uint price;

    constructor(uint _initialPrice) {
        price = _initialPrice;
    }

    function register() public payable costs(price) {
        require(msg.value >= price, "Not enough Ether provided");
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _newPrice) public onlyOwner {
        price = _newPrice;
    }
}
