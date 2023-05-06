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
     * @notice Returns the sign of a number 
     *           -1 if x < 0
     * sign(x) =  0 if x == 0
     *            1 if x > 0
     */
    function sign(int256 x) internal pure returns (int256) {
        int256 t;
    
        assembly {
            // t := x >>s 255 | (-x >>u 255)
            t := or(sar(255, x), shr(255, sub(0, x)))
        }

        return t;
    }
}