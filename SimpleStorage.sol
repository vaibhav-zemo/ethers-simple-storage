// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    // contract is like class
    // boolean, uint, int, address, bytes
    // bool istrue = true;
    // uint256 number = 5; // can be any 8, 32, 64
    // string name = "vaibhav";
    // int256 integer = -5;
    // address myaddress = 0x9563AB3A5D92703484D813535d3f29a51D6FfeBb;
    // bytes32 favoriteBytes = "pathak"; // can't go greater than 32 !64

    // this get initialized to zero
    uint256 public number;
    // People public person = People({favoriteNumber: 2, name: "vaibhav"});

    // uint256[] public list; now it is a array
    People[] public people;

    mapping(string => uint256) public nameTonumber;

    struct People {
        uint256 number;
        string name;
    }

    function store(uint256 _number) public virtual {
        number = _number;
        retrieve(); // on calling retrieve function from other function require gas
    }

    // view, pure // gas does'nt spend // in these function we could not update something
    function retrieve() public view returns (uint256) {
        return number;
    }

    // calldata, memory, storage variables
    // calldata is temporary and non mutable
    // memory is temporary and mutable
    // storage is permanent and mutable
    function addPerson(string memory _name, uint256 _number) public {
        // string,struct,mapping is like an array so it needs memory while unit not
        // People memory newPerson = People({number: _number, name: _name});
        people.push(People(_number, _name));
        nameTonumber[_name] = _number;
        // people.push(newPerson);
    }
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138 our node is deployed at this add
