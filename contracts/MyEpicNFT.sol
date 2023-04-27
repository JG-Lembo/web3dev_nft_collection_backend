//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.1;
// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

// Precisamos importar essa funcao de base64 que acabamos de criar
import { Base64 } from "./libraries/Base64.sol";
import { SVGGenerator } from "./libraries/SVGGenerator.sol";

// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract MyEpicNFT is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    string[] possibleBytes = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];

    mapping(address => bool) public ownerAddresses;
    mapping(address => uint256) public ownerTokenId;

    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721 ("ShinyCharmanders", "ShinyCharmanders"){
      console.log("Meu primeiro contrato de NFT! - Ass: JG10");
    }

    function generateSVGColors(string memory input) public view returns (string[] memory) {
      string[] memory colors = new string[](3);
      string[3] memory colorInput = ["FirstColor", "SecondColor", "ThirdColor"];
      for (uint i = 0; i < 3; i++) {
        colors[i] = generateColor(string(abi.encodePacked(colorInput[i], input)));
      }
      return colors;
    }

    function generateColor(string memory input) public view returns (string memory) {
      string[] memory colorBytes = new string[](6);
      string[6] memory byteInput = ["FirstByte", "SecondByte", "ThirdByte", "FourthByte", "FifthByte", "SixthByte"];
      for (uint i = 0; i < 6; i++) {
        colorBytes[i] = pickRandomByte(string(abi.encodePacked(byteInput[i], input)));
      }
      return(string(abi.encodePacked("#", colorBytes[0], colorBytes[1], colorBytes[2], colorBytes[3], colorBytes[4], colorBytes[5])));
    }

    function pickRandomByte(string memory input) public view returns (string memory) {
      uint256 rand = random(input);
      rand = rand % possibleBytes.length;
      return possibleBytes[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
    }

    function isOwner(address sender) public view returns (bool) {
      return ownerAddresses[sender];
    }

    function getOwnerToken(address sender) public view returns (uint256) {
      return ownerTokenId[sender];
    }

    function makeAnEpicNFT() public {

        require(_tokenIds.current() < 1000,
          "O numero maximo de NFTs cunhados desta colecao ja foi atingido.");

        require(ownerAddresses[msg.sender] == false,
          "Voce ja e dono de um NFT dessa colecao.");

        uint256 newItemId = _tokenIds.current();

        ownerAddresses[msg.sender] = true;
        ownerTokenId[msg.sender] = newItemId;

        string[] memory colors = generateSVGColors(string(abi.encodePacked(_tokenIds.current(), msg.sender)));

        string memory finalSvg = SVGGenerator.generateSVG(colors);

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        string(abi.encodePacked("Charmander #", Strings.toString(newItemId + 1))),
                        '", "description": "Uma colecao de Charmanders shiny exclusivos!.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, finalTokenUri);
        _tokenIds.increment();
        emit NewEpicNFTMinted(msg.sender, newItemId);
    }

    function getTotalNFTsMintedSoFar() public view returns (uint256) {
      return _tokenIds.current();
    }
}