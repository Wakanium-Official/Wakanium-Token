// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../security/Ownable.sol";
import "../security/Pausable.sol";
import "./StandardToken.sol";

abstract contract PausableToken is StandardToken, Pausable {
    function transfer(address _to, uint256 _value)
        public
        virtual
        override
        whenNotPaused
        returns (bool)
    {
        return super.transfer(_to, _value);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public virtual override whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value)
        public
        virtual
        override
        whenNotPaused
        returns (bool)
    {
        return super.approve(_spender, _value);
    }

    function increaseApproval(address _spender, uint256 _addedValue)
        public
        virtual
        override
        whenNotPaused
        returns (bool success)
    {
        return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(address _spender, uint256 _subtractedValue)
        public
        virtual
        override
        whenNotPaused
        returns (bool success)
    {
        return super.decreaseApproval(_spender, _subtractedValue);
    }

    function blackListAddress(address listAddress, bool isBlackListed)
        public
        whenNotPaused
        onlyOwner
        returns (bool success)
    {
        return super._blackList(listAddress, isBlackListed);
    }
}
