pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable CEO; // ceo
    address payable CTO; // cto
    address payable Bob; // bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        CEO = _one;
        CTO = _two;
        Bob = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        amount = points*60;
        // Step 2: Add the `amount` to `total` to keep a running total
        total += amount;
        // Step 3: Transfer the `amount` to the employee
        CEO.transfer(amount);

        // @TODO: Repeat the previous steps for `CTO` 
        amount = points*25;
       total += amount;
        CTO.transfer(amount);
        
        // @TODO: Repeat the previous steps for`Bob`
        amount = points*15;
        total += amount;
        Bob.transfer(amount);

        CEO.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
