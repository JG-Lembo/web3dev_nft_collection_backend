/**
 *Submitted for verification at Etherscan.io on 2021-09-05
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "hardhat/console.sol";

/// [MIT License]
/// @title SVGGenerator
/// @notice Provides a function for generating an svg
/// @author João Gabriel Lembo <brecht@loopring.org>
library SVGGenerator {
    function generateSVG(
        string[] memory colors
    ) internal pure returns (string memory) {
        string memory firstColor = colors[0];
        string memory secondColor = colors[1];
        string memory thirdColor = colors[2];

        string memory result = string(
            abi.encodePacked(
                "<svg xmlns='http://www.w3.org/2000/svg' width='350' height='404' viewBox='-0.4 -0.7 175.1 201.6'>  <path fill='",
                firstColor,
                "' d='M159 131q0 16-10 26-9 9-22 13-12 4-25 1-12-2-18-9l3-7 1-11q6 7 15 10 9 4 18 3 23-3 34-29l1 2 3 1'/>  <path fill='",
                secondColor,
                "' d='M84 162q14 12 33 10 17-2 32-13-15 17-38 17-9 0-17-2-7-3-11-7l1-5'/>  <path fill='",
                firstColor,
                "' d='m71 43-4 12-2 10q-1 2 1 9l1 11q5 22 10 31l9 16q4 10 2 18l-4 14-2 8 3 6q3 7 2 9l-5 5-6 2q-5 1-10-1t-5-5v-8l-1-8-3-3-4-7-8-1-2 2-3 3 2 3 1 5q-1 2-8 5l-14 2q-6 0-11-3-5-4-2-6l7-3q-4-3-6-8-3-9 9-20l-3-14q-2-11 0-21l-3 3-4 2-1-2v-3q-5 2-6 1v-3l4-6 5-10q7-11 15-16l-5-2q-4-3-9-11-7-10-7-17 0-3 3-7l4-5 5-13v-2l1-3q4-5 9-7 10-6 24-4 9 2 16 14 7 14 5 28'/>  <path fill='",
                secondColor,
                "' d='m37 79 8 14q10 22 9 44l-3 8q-2 10 1 17-8-1-16-5-18-8-21-26-2-14 1-32l6-19 3-3 6-3q2 0 6 5'/>  <path fill='#922f00' d='m9 46 3 2 5 4h3l-6 4-5-10'/>  <path fill='#ed8599' d='m20 52 16 2h13q-2 4-11 8-9 5-16 4l-3-3-5-7 6-4'/>  <path fill='#fff' d='m50 24-3 11q-1 6 1 11l-3-1q-2-3 0-10 2-8 5-11'/>  <path fill='#0d131a' d='M54 22q5 1 5 11l-1 11-4 2h-6q-2-5-1-11l3-11 4-2M11 30l2-8q3-7 6-6 2 1 0 11-3 10-5 10l-2-4-1-3'/>  <path fill='#fff' d='m7 45 5 3-3 2-2-5M14 56h2v3l-2-3M31 65v-2l1-1 3 2-4 1M32 54h6l-3 3-3-3M18 179l2-2 1-1q2 0 3 3l1 2-6 2h-5l1-1 1-1-6 1-3-1 1-1 1-1H1l3-4q4-3 5-2l2 4 1-1q1-2 3-1l2 2 1 2'/>  <path fill='#efe908' d='M148 85v7l1 2v-1l4 3v3l1 1v4l3 1-2 4v4l4-2v6l2 3v4l-1 4v3h-2l-3-3-4-2-4-1-2-2-2-5 2-4 1-3-1-2-1-3 1-3 1-3-1-2v-4l1-2v-4q-1-3 1-6l1 2v1'/>  <path fill='#e50020' d='M163 87q2 1 2 3l-1 7 2-1 2-2v10l1-1 1-1v8l4-6v6l-1 3-1 4v2l-1 1-2 2-2 2v2l-2 2-5 3v-3l1-4v-4l-2-3v-6l-4 2v-4l2-4-3-1v-4l-1-1v-3l-3-3 2-4-1-3 1-4 4-4 3-3 1-3v-4l1 2q2 4 1 6l-1 5v4l2 2'/>  <path fill='#fff' d='m55 24 2 2v5l-2 5-2 1-2-3v-4q0-3 2-5 1-2 2-1M19 17v5l-2 5-1 1-1-2 1-4 1-4q1-2 2-1'/>  <path fill='",
                thirdColor,
                "' d='m47 36 2-2v6q1 2 3 2l2-1 3-5 1 5-1 4-6 1h-3l-1-7v-3M17 28l1 2-1 3-3 4-2-3-1-3v-3l1-2 1-1h1l-1 5 1 2 2-1 1-3'/>  <path fill='#0d131a' d='M45 0q18 2 24 21 3 8 3 17 0 8-3 15l-3 8-1 7q-1 6-2 5v-5l4-15q3-6 3-15l-2-16Q62 4 45 2q-7-1-15 2-7 3-12 8l-1 2v3l-1 1v-1q-2-3 1-6 5-6 13-9t15-2'/>  <path fill='#0d131a' d='M57 44q2-5 1-13t-4-8q-3 0-6 6-4 7-3 16h6l6-1m-13 1q-1-8 2-16 4-8 8-7 6 0 6 10 0 9-2 13l-7 2q-7 0-7-2M18 16l-4 6-2 9 1 3 1 2q2-1 4-10 2-10 0-10m-5 5q3-7 6-6 3 0 1 11-3 11-6 11-1 1-2-2l-1-4 2-10M14 44v-2l1 1v3l-1-2M27 47h1l-1 1-2 1 1-1 1-1'/>  <path fill='#0d131a' d='m5 41 1-2v2l1 2 5 5 5 3 15 2 15 1 2-1 2-1 1-1v2l-2 1-2 1-15-1-16-2-6-3-5-5-1-1v-2'/>  <path fill='#0d131a' d='M10 49h1l6 11 6 5q4 1 12-2 9-4 13-9h2q-5 6-14 10t-14 2q-2 0-6-5l-6-11v-1'/>  <path fill='#0d131a' d='M7 45h1l1 2v2h1l1-1 1 1-2 1H9l-1-2-1-3M38 54l1 1-2 2-3 1-1-2-1-2v-1l1 1 1 2 1 1 1-1 2-2M14 56q-1 0 0 0h3v2l-1 1h-1l1-2v-1l-2 1v-1M32 61l1 1 2 1v1h-1l-2-2v3h-1v-2l1-2M25 71v2q-6 4-10 9T6 98l-4 5v3q1 1 5-1h1v1l1 4 2-1 4-4v1l-3 4-4 2q-2-1-2-5l-3 1-3-1v-3l4-7q6-11 11-16l10-10'/>  <path fill='#0d131a' d='m6 100-1 3h5l-2 1-4 1q-2-1 1-5 1-2 2-1l-1 1M25 72h1q-13 31-11 54 4 31 37 35l1 1v1q-36-4-40-36-2-24 12-55'/>  <path fill='#0d131a' d='M20 82q2-4 5-6l6-2q3 0 8 6 5 7 8 17 9 24 7 40l-1 2h-1q3-18-6-42l-8-15q-5-7-7-7l-5 2-5 7-1-2M63 68l1-3 1-2 6 33q3 14 10 24 10 17 7 31l-3 11-2 11-1 4-1-5 3-11 2-11q2-13-8-29-6-11-9-24l-6-29'/>  <path fill='#0d131a' d='M60 172h1l1 10v8l5 3h8q9 0 11-8l-2-7-2-6v-1l1-1 3 8 2 7q-2 9-13 10l-8-1q-5-1-6-3l-1-9q1-7-1-11l1 1'/>  <path fill='#0d131a' d='M54 136q1-4 2-3l-1 4q-5 9-3 18 1 10 9 17l2 3-3-2q-9-7-10-17-2-10 4-20M18 140l1 1q-4 3-7 8-3 6-3 10l3 6 6 5 3 2-4-1-7-5-3-7q0-5 4-11 3-5 7-8M40 167v-1h1l2 5v4l-6 4-13 3v-2q6 0 12-3l6-3v-3l-2-4'/>  <path fill='#0d131a' d='m14 168 1 1v1l-3 1-3 2H7l4-3 3-2M40 169l-2 2v-3l3-5 4-3 1 1h1l-4 3-3 5'/>  <path fill='#0d131a' d='m11 174 1 3h-2v-2l-1-1-4 2-3 2 3 1 4-1v1q1 0 0 0l-6 1-3-1 4-4q3-3 5-3l2 2'/>  <path fill='#0d131a' d='m17 179-1-3-1-1-4 3-3 3h3l5-1v1l-6 1H7q-1-1 2-4 3-4 5-4l3 1 1 4h-1'/>  <path fill='#0d131a' d='m13 184 3-5q3-3 5-3 1-1 3 2l1 3q0 2-6 3h-6m2-1 4-1 4-1v-3l-2-1-4 3-2 3M154 128h1l1 1q-6 13-15 20t-19 9q-10 1-20-3-9-3-15-10v-1l1-1q6 7 16 11 9 3 19 2 10-2 18-9t13-19'/>  <path fill='#0d131a' d='M159 131h1q-2 18-12 29-9 10-22 15-13 3-25 1t-18-8v-2q6 6 18 8t24-1q13-4 22-13 10-11 12-29'/>  <path fill='#0d131a' d='M158 140v3q-5 13-16 21-9 7-21 8-11 2-22-1-10-2-15-8v-1l1-1q5 6 15 9t21 1q13-2 22-9 10-8 15-22M168 97v-2l-1 1-3 2v-4q1-6-2-7l-2-2 1-4 1-6-1-5-1 4-2 2-5 6-1 4v3l-1 2-1 1v2l-1 2-1-2v-8l-1-2-1 2v3l1 3-1 2-1 2 1 2v3l-1 5 1 3 1 2-1 3-1 2-1 2 1 4 3 3 5 1 3 3 3 1q1 1 3-1l3-2 2-3 1-2 3-2 1-3v-4l1-3v-5l-1 2-1 3-2 2v-8l-2 1v-2l1-6m-5-24v3l-1 6v3q3 2 3 4v7q3-3 4-2t-1 9l2-1v6l2-3 1-2 1-2v12l-1 4q1 2-1 4l-4 3-1 2-2 2-2 2-4 2-4-2q-2-4-7-4-2 0-4-3l-2-4 2-4 1-4-1-1-1-2q-1-2 2-7v-3l-1-2 1-3v-8l2-3 1-1v3l1 3v6l1-3 1-2v-2q0-4 2-7l5-4 1-5 1-4 2 4 1 3M50 24h2q-4 4-4 11-1 7 1 11h-2q-2-4-1-11 1-8 4-11M21 52l1 1-4 1-4 2h-1v-1q4-3 8-3'/>  <path fill='#fff' d='m62 191 2-2 2-1 2 2 1 3-3 4-3 3-1-4v-5M72 193l1-3 2-2q2 0 3 2l1 6-1 4-3-2-3-5M82 191q0-3 2-4 2-2 3-1l1 6 1 5-4-2-3-4'/>  <path fill='",
                firstColor,
                "' d='m55 72 11 18q-2 8-10 15l-8 8-4 3-3 2-1-3-1-3-2 2h-4v-5l-3-1 2-2 3-4q2-10 11-21l9-9'/>  <path fill='#0d131a' d='m66 189-3 1v5l1 4 2-2 2-4-1-3-1-1m0-1q2 0 2 2l1 3-2 4q-3 4-4 3l-1-4v-6l1-2h3M78 190l-2-1h-1l-1 1-1 2 2 5 2 2 1-3v-6m-1-2 2 2v6l-1 5q-2 0-4-4-3-3-2-5v-3l3-1h2M83 191l2 3 3 2v-4l-2-5-2 1-1 3m-1 0q-1-2 1-4 1-2 3-2 2 1 3 7v6l-4-2q-3-3-3-5M52 74l3-2-2 3q-6 5-11 12l-6 15-2 2-2 2-1 2h3v2l-4-1q-2-1 1-4l2-2 1-1q2-8 7-16 5-7 11-12'/> <path fill='#0d131a' d='M11 29v2q-6 5-6 10-1 6 6 17t12 13h8l10-3h3l-3 2-11 2h-7q-6-2-13-13-8-12-7-18 0-3 3-6l5-6M51 20l-3 2-1 2-2 2v-2l5-5h1v1M20 14v-2l1 1q2 2 2 6 0 2-1 1l-1-1-1-5'/> <path fill='#0d131a' d='M64 93q1-4 2-3l-1 4-6 10q-4 5-9 8l-5 4q-3 3-5 3l-1-2v-4l-4 2h-2l-1-3 1-3 2-3v3l-1 4h2l3-1 1-1v1l1 5 4-2 4-4 8-8q5-5 7-10'/></svg>"
            )
        );

        return result;
    }
}