# {Workshop 12 Async}{11:00}{05/12/23}{Dalin Zhou}

## Hash Tables

- Hashing involves using an array for the efficient storage and retrieval of data
- Ideally, both the insertion and retrieval of data would have an efficiency of $O(n)$
- A hash table allows this, as far as possible with a finite array
- A perfect hash table has an infinite length, and has a hashing function which uniquely maps keys to the data they relate to
- It is not possible to do either of these things, and so some tradeoffs must be made

### Hashing Functions

- A good hashing function must
  - Be quick to compute
  - Minimise collisions
  - Evenly distribute keys
- There are a few types of hashing function
- Truncation
  - Ignore parts of the value and use the remaining parts as the hash value
  - This is very fast but does nothing to distribute keys evenly, or avoid collisions
- Folding
  - Split the value into several parts and then combine them in a different way to obtain the hash value
  - Usually results in better distribution than truncation
- Modulo Arithmetic
  - Divide the value by the table size and use the remainder as the hash value
  - To achieve good distribution, the size of the table should be a prime number

### Collisions

- A collision occurs when more than one data value results in the same key value
- In this situation, it must be decided how to handle the collision and there are multiple strategies
- Chaining
  - Singly linked lists (SLLs) are used to resolve collisions
  - Elements which collide are stored in an SLL with it's first element stored in the hash table
  - This is an easy method but is not fast, as SLLs have an efficiency of $O(n)$
- Linear probing
  - If an element collides, search the hash table linearly from the initial hash position and store the value in the first available slot
  - This makes both insertion and retrieval slower as there is a chance that the entire table must be searched linearly to check the item is not there
- Quadratic probing
  - Rather than linearly checking the next slot, check them quadratically
  - i.e. If a collision occurs, check $h + i^2$, so $h + 1$, $h + 4$, $h + 9$, etc
  - This works well if the size of the table is prime
- Double hashing
  - Two hashing functions, can either be the same or different functions, are used
  - The hash value of the first function is added to that of the second function repeatedly until a slot is found
  - i.e. If a collision occurs, check $h + g$, $h + 2g$, $h + 3g$, etc
  - This works well if the size of the table is prime
- Random rehashing
  - A pesudo-random number generator is used to generate the offsets
  - Since a seed is used for the random number generator, it is possible to recreate the sequence of random numbers when attempting to retrieve data
  - This method is excellent at avoiding collisions but much slower than the other available methods

### Deletion

- When deleting an item from a hash table, you cannot leave that space blank
- This is because it would break the following keys in the group which hashed to the same key
- Instead, a special value or flag can be used to mark that the space is free for insertion, but searches should continue looking and not stop there
- When inserting, we can check if a space is free, or has this special value in it
- When searching, we can still check if there is an item in the space, as it is taken up by the flag