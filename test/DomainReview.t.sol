// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/DomainReview.sol";

contract DomainReviewTest {
    function testDomainReviewLane() public pure {
        DomainReview lens = new DomainReview();
        DomainReview.Item memory item = DomainReview.Item(66, 38, 27, 89);
        require(lens.score(item) == 178, "domain score mismatch");
        require(lens.lane(item) == 2, "domain lane mismatch");
    }
}
