// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.17;

/// @title Hackers Delight Library
/// @author danyams
/// @dev This library is a collection of useful bitwise operations

library HackersDelight {
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
     * @notice Signed right shift...
     * @param x The number to shift
     * @param n The number of bits to shift
     * @return The shifted number
     */
    function signedRightShift(int256 x, uint256 n) internal pure returns(int256) {
        uint256 t = 1 << (255 - n);

        uint256 y = ((uint256(x) >> n) ^ t) - t;

        return int256(y);
    }

    function sign(int256 x) internal pure returns (int256) {
        return signedRightShift(x, 255) | (-x >> 255);
    }
}