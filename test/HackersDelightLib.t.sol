// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.17;

import "forge-std/Test.sol";
import {HackersDelight} from "../src/HackersDelightLib.sol";

contract HackersDelightTests is Test {

    function _isEven(uint256 x) internal pure returns (bool) {
        return (x & 1) == 0;
    }

    function _isOdd(uint256 x) internal pure returns (bool) {
        return (x & 1) == 1;
    }

    function testFuzz_FloorAvg(uint256 x, uint256 y) public {
        uint256 expected;

        if (_isOdd(x) && _isOdd(y)) {
            expected = (x/2) + (y/2) + 1;
        } else {
            expected = (x/2) + (y/2);
        }

        uint256 actual = HackersDelight.floorAvg(x, y);
        assertEq(actual, expected, "Wrong floor average");
    }

    function testFuzz_CeilAvg(uint256 x, uint256 y) public {
        uint256 expected;

        if (_isEven(x) && _isEven(y)) {
            expected = (x/2) + (y/2);
        } else {
            expected = (x/2) + (y/2) + 1;
        }

        uint256 actual = HackersDelight.ceilAvg(x, y);
        assertEq(actual, expected, "Wrong ceiling average");  
    }

    function test_SignedRightShift(uint256 x, uint256 n) public {
        vm.assume(n < 255);
        int256 expected = int256(x >> n);
        int256 actual = HackersDelight.signedRightShift(int256(x), n);
        assertEq(actual, expected, "Wrong signed right shift");
    }

    function test_SignedRightShift_NoLib() public {

        // X = 8
        uint256 x = 0x100;

        int256 y = -1;

        console.log("yBytes: %s", y);
    }
}