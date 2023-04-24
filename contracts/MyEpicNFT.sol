//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.1;
// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Precisamos importar essa funcao de base64 que acabamos de criar
import { Base64 } from "./libraries/Base64.sol";

// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract MyEpicNFT is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string baseSvg = "<svg  xmlns='http://www.w3.org/2000/svg'  preserveAspectRatio='xMinYMin meet'  viewBox='0 0 350 350'>  <defs>    <linearGradient id='Gradient1'>      <stop class='stop1' offset='0%'/>      <stop class='stop2' offset='50%'/>      <stop class='stop3' offset='100%'/>    </linearGradient>  </defs>  <style>    .base {      fill: blue;      font-family: serif;      font-size: 20px;      color: #FFF;    }    .stop1 { stop-color: green; }    .stop2 { stop-color: white; stop-opacity: 0; }    .stop3 { stop-color: yellow; }      </style>  <rect width='100%' height='100%' fill='url(#Gradient1)' />  <text    x='50%'    y='50%'    class='base'    dominant-baseline='middle'    text-anchor='middle'  >";

    string[] firstWords = ["Charmander", "Bulbasaur", "Squirtle", "Chikorita", "Cyndaquil", "Totodile", "Torchic", "Treecko", "Mudkip", "Chimchar", "Piplup", "Turtwig", "Snivy", "Oshawott", "Tepig"];
    string[] secondWords = ["Charmeleon", "Ivysaur", "Wartortle", "Bayleef", "Quilava", "Croconaw", "Combusken", "Grovyle", "Marshtomp", "Monferno", "Prinplup", "Grotle", "Servine", "Dewott", "Pignite"];
    string[] thirdWords = ["Charizard", "Venusaur", "Blastoise", "Meganium", "Typhlosion", "Feraligatr", "Blaziken", "Sceptile", "Swampert", "Infernape", "Empoleon", "Torterra", "Serperior", "Samurott", "Emboar"];
    
    event NewEpicNFTMinted(address sender, uint256 tokenId);

    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721 ("SquareNFT", "SQUARE"){
      console.log("Meu primeiro contrato de NFT! - Ass: JG10");
    }

    function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
      uint256 rand = random(string(abi.encodePacked("PRIMEIRA_PALAVRA", Strings.toString(tokenId))));
      rand = rand % firstWords.length;
      return firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
      uint256 rand = random(string(abi.encodePacked("SEGUNDA_PALAVRA", Strings.toString(tokenId))));
      rand = rand % secondWords.length;
      return secondWords[rand];
    }

    function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
      uint256 rand = random(string(abi.encodePacked("TERCEIRA_PALAVRA", Strings.toString(tokenId))));
      rand = rand % secondWords.length;
      return thirdWords[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
    }

    // Uma função que o nosso usuário irá chamar para pegar sua NFT.
    function makeAnEpicNFT() public {

        require(_tokenIds.current() < 1000,
          "O numero maximo de NFTs cunhados desta colecao ja foi atingido.");

        // Pega o tokenId atual, que começa por 0.
        uint256 newItemId = _tokenIds.current();

        string memory first = pickRandomFirstWord(newItemId);
        string memory second = pickRandomSecondWord(newItemId);
        string memory third = pickRandomThirdWord(newItemId);
        string memory combinedWord = string(abi.encodePacked(first, second, third));

        string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        // Definimos aqui o titulo do nosso NFT sendo a combinacao de palavras.
                        combinedWord,
                        '", "description": "Uma colecao aclamada e famosa de NFTs maravilhosos.", "image": "data:image/svg+xml;base64,',
                        // Adicionamos data:image/svg+xml;base64 e acrescentamos nosso svg codificado com base64.
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        // Assim como antes, prefixamos com data:application/json;base64
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        console.log("\n--------------------");
        console.log(finalTokenUri);
        console.log("--------------------\n");

        // Minta ("cunha") o NFT para o sender (quem ativa o contrato) usando msg.sender.
        _safeMint(msg.sender, newItemId);
        // Designa os dados do NFT.
        _setTokenURI(newItemId, finalTokenUri);
        console.log("Um NFT com o ID %s foi mintado para %s", newItemId, msg.sender);
        // Incrementa o contador para quando o próximo NFT for mintado.
        _tokenIds.increment();
        emit NewEpicNFTMinted(msg.sender, newItemId);
    }

    function getTotalNFTsMintedSoFar() public view returns (uint256) {
      return _tokenIds.current();
    }
}