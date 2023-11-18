// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract MySmartNFT is  ERC721URIStorage {
    uint256 private _tokenIdTracker;

    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Woah!");
        _tokenIdTracker = 0; 
    }

    function makeAnEpicNFT() public {
        uint256 newItemId = _tokenIdTracker;
        _safeMint(msg.sender, newItemId);
        tokenURI(newItemId);
        _tokenIdTracker += 1; 
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        address owner = ownerOf(_tokenId);
        require(owner != address(0), "Token ID does not exist");

        console.log("An NFT w/ ID %s has been minted to %s", _tokenId, owner);
        return "INSERT_YOUR_JSON_URL_HERE";
    }

}
