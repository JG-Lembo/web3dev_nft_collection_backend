//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.1;
// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract MyEpicNFT is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721 ("SquareNFT", "SQUARE"){
      console.log("Meu primeiro contrato de NFT! - Ass: JG10");
    }
    // Uma função que o nosso usuário irá chamar para pegar sua NFT.
    function makeAnEpicNFT() public {
        // Pega o tokenId atual, que começa por 0.
        uint256 newItemId = _tokenIds.current();
        // Minta ("cunha") o NFT para o sender (quem ativa o contrato) usando msg.sender.
        _safeMint(msg.sender, newItemId);
        // Designa os dados do NFT.
        _setTokenURI(newItemId, "data:application/json;base64,ewogICJuYW1lIjogIlR1YmFpbmFNb3F1ZWNhTWFyYWN1amEiLAogICJkZXNjcmlwdGlvbiI6ICJVbSBORlQgc3VwZXIgZmFtb3NvIGRlIHVtYSBjb2xlw6fDo28gZGUgcXVhZHJhZG9zIiwKICAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWndvZ0lIaHRiRzV6UFNKb2RIUndPaTh2ZDNkM0xuY3pMbTl5Wnk4eU1EQXdMM04yWnlJS0lDQndjbVZ6WlhKMlpVRnpjR1ZqZEZKaGRHbHZQU0o0VFdsdVdVMXBiaUJ0WldWMElnb2dJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWdvK0NpQWdQR1JsWm5NK0NpQWdJQ0E4YkdsdVpXRnlSM0poWkdsbGJuUWdhV1E5SWtkeVlXUnBaVzUwTVNJK0NpQWdJQ0FnSUR4emRHOXdJR05zWVhOelBTSnpkRzl3TVNJZ2IyWm1jMlYwUFNJd0pTSXZQZ29nSUNBZ0lDQThjM1J2Y0NCamJHRnpjejBpYzNSdmNESWlJRzltWm5ObGREMGlOVEFsSWk4K0NpQWdJQ0FnSUR4emRHOXdJR05zWVhOelBTSnpkRzl3TXlJZ2IyWm1jMlYwUFNJeE1EQWxJaTgrQ2lBZ0lDQThMMnhwYm1WaGNrZHlZV1JwWlc1MFBnb2dJRHd2WkdWbWN6NEtJQ0E4YzNSNWJHVStDaUFnSUNBdVltRnpaU0I3Q2lBZ0lDQWdJR1pwYkd3NklHSnNkV1U3Q2lBZ0lDQWdJR1p2Ym5RdFptRnRhV3g1T2lCelpYSnBaanNLSUNBZ0lDQWdabTl1ZEMxemFYcGxPaUF5TUhCNE93b2dJQ0FnSUNCamIyeHZjam9nSTBaR1Jqc0tJQ0FnSUgwS0lDQWdJQzV6ZEc5d01TQjdJSE4wYjNBdFkyOXNiM0k2SUdkeVpXVnVPeUI5Q2lBZ0lDQXVjM1J2Y0RJZ2V5QnpkRzl3TFdOdmJHOXlPaUIzYUdsMFpUc2djM1J2Y0MxdmNHRmphWFI1T2lBd095QjlDaUFnSUNBdWMzUnZjRE1nZXlCemRHOXdMV052Ykc5eU9pQjVaV3hzYjNjN0lIMEtJQ0FnSUFvZ0lEd3ZjM1I1YkdVK0NpQWdQSEpsWTNRZ2QybGtkR2c5SWpFd01DVWlJR2hsYVdkb2REMGlNVEF3SlNJZ1ptbHNiRDBpZFhKc0tDTkhjbUZrYVdWdWRERXBJaUF2UGdvZ0lEeDBaWGgwQ2lBZ0lDQjRQU0kxTUNVaUNpQWdJQ0I1UFNJMU1DVWlDaUFnSUNCamJHRnpjejBpWW1GelpTSUtJQ0FnSUdSdmJXbHVZVzUwTFdKaGMyVnNhVzVsUFNKdGFXUmtiR1VpQ2lBZ0lDQjBaWGgwTFdGdVkyaHZjajBpYldsa1pHeGxJZ29nSUQ0S0lDQWdJRlIxWW1GcGJtRk5iM0YxWldOaFRXRnlZV04xYW1FS0lDQThMM1JsZUhRK0Nqd3ZjM1puUGc9PSIKfQ==");
        console.log("Um NFT com o ID %s foi mintado para %s", newItemId, msg.sender);
        // Incrementa o contador para quando o próximo NFT for mintado.
        _tokenIds.increment();
    }
}