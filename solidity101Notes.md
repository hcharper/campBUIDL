--- Security Practices ---
    - Dont Store private keys in PLAIN TEXT in the .env file

--- Solidity 101 ---

    - Using the correct bit size for numbers saves storage and thus money (uint8 vs unit64)
    - Mapping = hashtable (not iterable, you cant loop through all the keys)
        - Very useful to store things like balances, and / or ownership records , etc... (mapped to wallet addresses)
        - Keys can be indexes, names, etc... (ex. [key, value] --> [name, balance] or even --> [walletAddress, balance])


--- Blockchain Tips ---
    - Dont use loops on dynamic arrays, you will run out of gas (limit of how much you  can spend every 12 seconds on ETH)
        - NO FOR LOOPS (mostly)
    - Throw failures with require(bool, "error message")
    - msg.sender = address of person calling the function
    - msg.value = amount of ETH sent in the transaction
    - Block.number = number of block order in ETH
    - Block.timestamp = time block was mined (~12 seconds per block)
        - dont use for randomness
        - Do use for making things happen after a ertain period of time
        - https://etherscan.io/chart/blocktime

    - Why shouldnt we use block.timestamp to get randomness
        - Someone else can replicate the same "randomness" in the same block (BAD)