// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

interface IBirdSwap {
    /// @notice The metadata for an ask
    /// @param seller The address of the seller placing the ask
    /// @param sellerFundsRecipient The address to send funds after the ask is filled
    /// @param askPrice The price to fill the ask
    struct Ask {
        address seller;
        uint256 askPrice;
        uint256 royaltyFeeBps;
    }


    /// @notice Emitted when an ask is created
    /// @param tokenId The ERC-721 token ID of the created ask
    /// @param ask The metadata of the created ask
    event AskCreated(uint256 indexed tokenId, Ask ask);

    /// @notice Emitted when an ask price is updated
    /// @param tokenId The ERC-721 token ID of the updated ask
    /// @param ask The metadata of the updated ask
    event AskPriceUpdated(uint256 indexed tokenId, Ask ask);

    /// @notice Emitted when an ask is canceled
    /// @param tokenId The ERC-721 token ID of the canceled ask
    /// @param ask The metadata of the canceled ask
    event AskCanceled(uint256 indexed tokenId, Ask ask);

    /// @notice Emitted when an ask is filled
    /// @param tokenId The ERC-721 token ID of the filled ask
    /// @param buyer The buyer address of the filled ask
    /// @param ask The metadata of the filled ask
    event AskFilled(uint256 indexed tokenId, address indexed buyer, Ask ask);

    /// @notice Emitted when an bird is withdrawn without a sale by the original owner
    /// @param tokenId The ERC-721 token ID of the filled ask
    /// @param to The address the bird was withdrawn to
    event BirdWithdrawn(uint256 indexed tokenId, address to);

}