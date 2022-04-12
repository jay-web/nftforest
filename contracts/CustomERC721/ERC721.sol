// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ERC721 {

    // * Transfer event emit when ownership of token changes
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    // * Mapping tokenId belong to which owner
    mapping(uint256 => address) internal _tokenOwner;

    // * Mapping how many tokens has been related to individual address
    mapping(address => uint256) internal _ownedTokenCount;

    // * Check whether token already exists or not
    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Minting to the zero address");
        require(!_exists(tokenId), "Token already exists");
        _tokenOwner[tokenId] = to;
        _ownedTokenCount[to] = _ownedTokenCount[to]++;

        emit Transfer(address(0), to, tokenId);
        
    }
}