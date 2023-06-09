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

    function testFuzz_Sign_NegativeInt256(int256 x) public {
        vm.assume(x < 0);
        int256 actual = HackersDelight.sign(x);
        assertEq(actual, -1, "Wrong sign");
    }

    function test_Sign_Zero() public {
        int256 actual = HackersDelight.sign(0);
        assertEq(actual, 0, "Wrong sign");
    }

    function testFuzz_Sign_PositiveInt256(int256 x) public {
        vm.assume(x > 0);
        int256 actual = HackersDelight.sign(x);
        assertEq(actual, 1, "Wrong sign");
    }

    function testFuzz_ThreeValuedCompare_Int256_LessThan(int256 x, int256 y) public {
        vm.assume(x < y);
        int256 actual = HackersDelight.threeValuedCompare(x, y);
        assertEq(actual, -1, "Wrong result");
    }

    function testFuzz_ThreeValuedCompare_Int256_Equal(int256 x) public {
        int256 actual = HackersDelight.threeValuedCompare(x, x);
        assertEq(actual, 0, "Wrong result");
    }

    function testFuzz_ThreeValuedCompare_Int256_GreaterThan(int256 x, int256 y) public {
        vm.assume(x > y);
        int256 actual = HackersDelight.threeValuedCompare(x, y);
        assertEq(actual, 1, "Wrong result");
    }

    function testFuzz_ThreeValuedCompare_Uint256_LessThan(uint256 x, uint256 y) public {
        vm.assume(x < y);
        int256 actual = HackersDelight.threeValuedCompare(x, y);
        assertEq(actual, -1, "Wrong result");
    }

    function testFuzz_ThreeValuedCompare_Uint256_Equal(uint256 x) public {
        int256 actual = HackersDelight.threeValuedCompare(x, x);
        assertEq(actual, 0, "Wrong result");
    }

    function testFuzz_ThreeValuedCompare_Uint256_GreaterThan(uint256 x, uint256 y) public {
        vm.assume(x > y);
        int256 actual = HackersDelight.threeValuedCompare(x, y);
        assertEq(actual, 1, "Wrong result");
    }
}