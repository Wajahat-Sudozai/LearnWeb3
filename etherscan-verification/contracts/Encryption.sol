// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract encryption{
    bytes32 public key;

    IERC721 private ERC721;

    function _transfar(address from,address to,uint256 tokenId,address ERC721contract,string memory _key)public {
        require(key==Encryption(_key),"Invalid encryption key");
        IERC721(ERC721contract).transferFrom(from,to,tokenId);
    }
    function _Updatekey(bytes32 _key)public{
        key=_key;
    }
   
   function Encryption(string memory _key)public pure returns(bytes32)
   {
       return keccak256(abi.encodePacked(_key));
   }

 
} 
