// Authentication.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Authentication is ERC721, Ownable {
    constructor(address initialOwner) ERC721("AuthenticationToken", "AUTH") Ownable(initialOwner) {}

    mapping(uint256 => bool) private _tokenExists;
    mapping(address => mapping(uint256 => bool)) private _accountTokens;
    function mintToken(address to, uint256 tokenId) public onlyOwner {
        require(!_accountTokens[to][tokenId], "Token already minted for this account and ID");
        _safeMint(to, tokenId);
        _tokenExists[tokenId] = true;
        _accountTokens[to][tokenId] = true;
    }

    function authenticate(uint256 tokenId) public view returns (bool) {
        return _tokenExists[tokenId];
    }
}
