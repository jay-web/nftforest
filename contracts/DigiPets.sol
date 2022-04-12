// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CustomERC721/ERC721Connector.sol";

contract DigiPets is ERC721Connector {

    // String array to store our digital pets
    string [] public digiPets;

    // mapping to store digitPets exitance
    mapping(string => bool) _digitPetsExist;
    
    constructor() ERC721Connector("Digipets", "DGP"){
       
    }

    //  Count all the NFT related to particular owner address
    function balanceOf(address _owner) public view returns(uint256){
       require(_owner != address(0), "No NFT associated with zero address");
       return _ownedTokenCount[_owner];
    }

    //  Owner of particular NFT by token
    function ownerOf(uint256 _tokenId) public view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), "No NFT associated with zero address");
        return owner;
    }

    function mint(string memory _digiPet) public {
        // * Check digitPet is already exists or not
        require(!_digitPetsExist[_digiPet], "Digitpet is already exist in store");

        digiPets.push(_digiPet);
        uint id = digiPets.length - 1;
        
        _mint(msg.sender, id); 

        _digitPetsExist[_digiPet] = true;
    }
}