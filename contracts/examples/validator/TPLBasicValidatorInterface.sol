pragma solidity ^0.4.25;


/**
 * @title TPL Basic Validator interface. EIP-165 ID: 0xd13d3f23
 */
interface TPLBasicValidatorInterface {
  /**
   * @notice Check if contract is assigned as a validator on the jurisdiction.
   * @return True if validator is assigned, false otherwise.
   */  
  function isValidator() external view returns (bool);

  /**
   * @notice Check if the validator is approved to issue attributes of the type
   * with ID `attributeTypeID` on the jurisdiction.
   * @param attributeTypeID uint256 The ID of the attribute type in question.
   * @return True if validator is approved to issue attributes of given type.
   */  
  function canIssueAttributeType(
    uint256 attributeTypeID
  ) external view returns (bool);

  /**
   * @notice Check if the validator is approved to issue an attribute of the
   * type with ID `attributeTypeID` to account `account` on the jurisdiction.
   * @param account address The account to check for issuing the attribute to.
   * @param attributeTypeID uint256 The ID of the attribute type in question.
   * @return Bool indicating if attribute is issuable & byte with status code.
   */  
  function canIssueAttribute(
    address account,
    uint256 attributeTypeID
  ) external view returns (bool, bytes1);

  /**
   * @notice Check if the validator is approved to revoke an attribute of the
   * type with ID `attributeTypeID` from account `account` on the jurisdiction.
   * @param account address The checked account for revoking the attribute from.
   * @param attributeTypeID uint256 The ID of the attribute type in question.
   * @return Bool indicating if attribute is revocable & byte with status code.
   */  
  function canRevokeAttribute(
    address account,
    uint256 attributeTypeID
  ) external view returns (bool, bytes1);

  /**
   * @notice Issue an attribute of the type with ID `attributeTypeID` to account
   * `account` on the jurisdiction.
   * @param account address The account to issue the attribute to.
   * @param attributeTypeID uint256 The ID of the attribute type in question.
   * @dev Note that the function is payable - this is so that the function in
   * question can support both basic and extended jurisdictions. Attaching a
   * value when utilizing a basic jurisdiction will revert the transaction.
   */  
  function issueAttribute(
    address account,
    uint256 attributeTypeID
  ) external payable;

  /**
   * @notice Revoke an attribute of the type with ID `attributeTypeID` from
   * account `account` on the jurisdiction.
   * @param account address The account to revoke the attribute from.
   * @param attributeTypeID uint256 The ID of the attribute type in question.
   */  
  function revokeAttribute(address account, uint256 attributeTypeID) external;

  /**
   * @notice Get account of utilized jurisdiction and associated attribute
   * registry managed by the jurisdiction.
   * @return The account of the jurisdiction.
   */
  function getJurisdiction() external view returns (address);
}