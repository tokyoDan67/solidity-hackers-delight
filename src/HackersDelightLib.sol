// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.17;

/// @title Hackers Delight Library
/// @author danyams
/// @dev This library is a collection of useful bitwise operations

library HackersDelight {

    struct Bytes32Struct{
        bytes32 value;
    }

    struct Uint256Struct {
        uint256 value;
    }

    struct Int256Struct {
        int256 value;
    }   

    /**
     * @notice Returns the floor average of two numbers without overflowing
     * @param x The first number
     * @param y The second number
     * @return The floor average
     */
    function floorAvg(uint256 x, uint256 y) internal pure returns (uint256) {
        return (x & y) + ((x ^ y) >> 1);
    }

    /**
     * @notice Returns the ceiling average of two numbers without overflowing
     * @param x The first number
     * @param y The second number
     * @return The ceiling average
     */
    function ceilAvg(uint256 x, uint256 y) internal pure returns (uint256) {
        return (x | y) - ((x ^ y) >> 1);
    }
    
    /**
     * @notice Returns the sign of a number:
     *           -1 if x < 0
     * sign(x) =  0 if x == 0
     *            1 if x > 0
     * @param x The number
     * @return The sign of the number as an int256
     */
    function sign(int256 x) internal pure returns (int256) {
        int256 t;
    
        assembly {
            // t := x >>s 255 | (-x >>u 255)
            t := or(sar(255, x), shr(255, sub(0, x)))
        }

        return t;
    }

    /**
     * @notice Returns the three-valued compare function of two int256s:
     *             -1 if x < y
     * cmp(x, y) =  0 if x == y
     *              1 if x > y
     * @param x The first number
     * @param y The second number
     * @return The result of the three-valued compare function as an int256
     */
    function threeValuedCompare(int256 x, int256 y) internal pure returns (int256) {
        int256 t;

        assembly {
            // t := (x > y) - (x < y)
            t := sub(sgt(x, y), slt(x,y))
        }

        return t;
    }

    /**
     * @notice Returns the three-valued compare function of two uint256s:
     *             -1 if x < y
     * cmp(x, y) =  0 if x == y
     *              1 if x > y
     * @param x The first number
     * @param y The second number
     * @return The result of the three-valued compare function as an int256
     */
    function threeValuedCompare(uint256 x, uint256 y) internal pure returns (int256) {
        int256 t;

        assembly {
            // t := (x > y) - (x < y)
            t := sub(gt(x, y), lt(x,y))
        }

        return t;
    }

    /**
     * @notice Returns the transfer of sign function of two int256s:
     *             abs(x) if y >= 0
     * ISIGN(x) = -abs(x) if y < 0
     * @param x The first number
     * @param y The second number
     * @return the result of the transfer of sign function as an int256
     */
    function iSign(int256 x, int256 y) internal pure returns (int256) {
        int256 t;
        int256 k;

        assembly {
            t := sar(255, xor(x, y))
            k := sub(xor(x, t), t)
        }

        return k;
    }
}