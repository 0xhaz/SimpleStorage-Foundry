// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract SimpleStorageTest is StdCheats, Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        simpleStorage = new SimpleStorage();
    }

    function testStore() external {
        simpleStorage.store(10);
        uint256 result = simpleStorage.display();
        assertEq(result, 10, "store() should set myFavoriteNumber to 10");
    }

    function testAddPerson() external {
        simpleStorage.addPerson("Alice", 10);
        uint256 result = simpleStorage.nameToFavoriteNumber("Alice");
        assertEq(
            result,
            10,
            "addPerson() should set nameToFavoriteNumber['Alice'] to 10"
        );
    }
}
