// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SubscriptionService {
    address public owner;
    uint256 public subscriptionFee;
    mapping(address => uint256) public subscribers;

    constructor(uint256 _fee) {
        owner = msg.sender;
        subscriptionFee = _fee;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function subscribe() external payable {
        require(msg.value == subscriptionFee, "Incorrect fee");
        subscribers[msg.sender] = block.timestamp + 30 days;
    }

    function isSubscribed(address _user) external view returns (bool) {
        return subscribers[_user] > block.timestamp;
    }

    function remainingTime(address _user) external view returns (uint256) {
        if (subscribers[_user] > block.timestamp) {
            return subscribers[_user] - block.timestamp;
        } else {
            return 0;
        }
    }

    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}



"added one function suggested by chatGPT"
"updated"

