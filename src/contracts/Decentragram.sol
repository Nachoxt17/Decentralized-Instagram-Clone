pragma solidity ^0.5.0;

contract Decentragram {
  string public name = "Decentragram";
  
  //+-Store Posts/Images:_
  uint public imageCount = 0;
  mapping(uint => Image) public images;

  struct Image {
    uint id;
    string hash;
    string description;
    uint tipAmount;
    address payable author;
  }

  event ImageCreated(
    uint id, 
    string hash, 
    string description, 
    uint tipAmount, 
    address payable author
  );

  //+-Create Posts/Images:_
  function uploadImage(string memory _imageHash, string memory _description) public {
    //+-Make Sure Image hash exists:_
    require(bytes(_imageHash).length > 0);

    //+-Make Sure Image description exists:_
    require(bytes(_description).length > 0);

    //+-Make Sure Uploader address exists:_
    require(msg.sender != address(0));

    //+-Increment ImageId/imageCount:_
    imageCount ++;

    //+-Add image to contract:_
    images[imageCount] = Image(imageCount, _imageHash, _description, 0, msg.sender);

    //+-Trigger an Event:_
    emit ImageCreated(imageCount, _imageHash, _description, 0, msg.sender);
  }
  //+-Tip Posts/Images:_
}