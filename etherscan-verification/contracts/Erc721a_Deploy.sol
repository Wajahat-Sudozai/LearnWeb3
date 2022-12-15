// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721a.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


contract Erc21aBatchMinting is ERC721A,AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    using Strings for uint256;
    string private baseUri;

    constructor(uint256 _maxBatchSize,string memory uri) ERC721A("Erc721A Token", "EAT", _maxBatchSize) {
    baseUri=uri;
    _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    _grantRole(MINTER_ROLE, msg.sender);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721A, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function mint(address to, uint256 quantity) public onlyRole(MINTER_ROLE){
        _safeMint(to, quantity);
    }

    function _baseURI() internal view virtual override  returns (string memory) {
    return baseUri;
    }

    function updateBaseUri(string memory uri)public onlyRole(MINTER_ROLE){
     baseUri=uri;
    }

    function tokenURI(uint256 tokenId)public view virtual override returns (string memory)
    {
    require(_exists(tokenId),"ERC721Metadata: URI query for nonexistent token");
    string memory baseURI = _baseURI();
    return
        bytes(baseURI).length > 0
        ? string(abi.encodePacked(baseURI, tokenId.toString(),".json"))
        : "";
    }

    function batchTransferFrom(address[] memory addressTo, uint256[] memory tokenIds) public{
       require(addressTo.length==tokenIds.length,"WorldTennisleague: length mismatch");
       for (uint256 index = 0; index < addressTo.length; ++index){
            safeTransferFrom(msg.sender, addressTo[index], tokenIds[index], '');
        }
    }
}