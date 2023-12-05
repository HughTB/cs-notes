# {Workshop 13 and 14 Async}{11:00}{12/11/23}{Dalin Zhou}

## Heaps

- A max-heap is a binary tree with the following characteristics
  - It is a complete binary tree - all levels other than the last are full and the last level has all it's leaves on the left side
  - The key in the root is larger than both child nodes
  - Both subtrees satisfy these requirements
- A heap can be implemented using a linear datastructure, such as a list or array
  - The root of the tree is stored at element 0
  - Then it's children are stored from left to right, and so on down the tree
  - We can get the index of the current node's children or parent using the following formulae, assuming the indexes start at 0
    - $p = \frac{c - 1}{2}$ where p = parent index, c = current index
    - $l = 2c + 1$ where l = left index, c = current index
    - $r = 2c + 2$ where r = right index, c = current index
- A heap can be used to implement
  - Djikstra's Algotithm
  - Kruskal's Algotithm
  - Huffman's Algorithm
  - Priority Queues

### Insertion

- When an item is inserted, it is always placed as the next leaf on the lowest level
- If the lowest level is full, it is placed as the left-most node on a new, lower level
- Insertion will probably break the heap properties of the tree, and so must be corrected
  - The inserted item is moved up the tree until it either ends up as the root node, or finds a parent which restores the heap properties

### Deletion

- Any item in the tree can be deleted at any time, but this may leave two detached subtrees
- To restore the tree, move the right-most item on the lowest level into the root, then move it down the tree until the heap properties are restored

## Priority Queues

- A priority queue is an abstract data type with the following operations
  - Insert an element with an associated priority
  - Remove the element with the highest priority
- This can be implemented with a static, unsorted array
  - Each entry contains the value of the element, and it's priority
  - Inserting an element is efficient as it can be inserted into the first empty space, and so has a Big-O of $O(1)$
  - Removing an element however, is inefficient as the entire array must be searched to find the element with the highest priority, and so has a Big-O of $O(n)$
- It can alternatively be implemented using a heap
  - The highest priority item will always be sorted to the root of the tree
  - This gives a Big-O of $O(log_2 n)$ for both insertion and removal

## Heap Sort

- A heap can be used as a form of sorting algorithm
- Build a heap form the elements to be sorted
- Retrieve the root of the tree as the largest or smallest item for a max- and min-heap respectively
- Swap the root with the rightmost leaf on the biottom level
- Rebuild the heap without the previous root
- Recurse this algorithm until the last node is found

## Data Compression

- Since files such as videos can be very large when stored at original quality, compression is needed to reduce the size and bandwith needed to store and transfer files
- We only talk about text compression as this is the most simple to implement, but most of the concepts carry over to other types of data
- Both the sender and reciever of the data must know and understand the encoding scheme used to represent the text
- There are two types of data compression
- Lossless Compression
  - All of the original data can be reproduced using only the compressed data
  - Used in text compression, as al of the original text must be preserved
  - Compression ratios of between 2:1 and 8:1 depending upon the implementation
- Lossy Compression
  - The decompressed data is slightly different to the original data, and the original data cannot be reproduced
  - A small loss of accuracy is traded for a massive increase in compression ratio
  - Used for the compression of sound, images and videos where a slight loss of data is acceptable given the greatly reduced size

### Fixed-Length Coding

- Each of the codes used to represent a chunk of data are the same length
- This is efficient when only needing to represent a small number of codes
- e.g. If only 4 different codes were needed, they could be represented by a 2-bit number
  - This would allow 4 different values of arbitrary length to be encoded using only 2 bits each
  - For a message made up with only 4 letters, the length could be reduced by 4-fold by reducing the number of bits for each letter from 8 to 2

### Variable-Length Coding

- Each of the codes used to represent a chunk of data can be any length
- Shorter codes are used for more frequently occuring characters
- Longer codes are used for less frequently occuring characters
- Using variable length coding can reduce the size of an encoded string
- It is possible for the size to be increased, if the codebook is implemented improperly or if the frequency of characters is relatively similar
- Decoding is also slower as it hard to determine how many bits in the encoded string correspond to which codes

## Huffman Coding

- Huffman coding uses a statistical method to determine each variable-length code
- The most frequently occuring characters are converted to short codes and the least frequent charactesr are converted to longer codes
- A huffman tree is a weighted binary tree where
  - Each leaf node represents a character to be encoded
  - Each branch is labelled with a 1 or 0
- Huffman codes are determined by following the path from the root to the leaf node in question, adding a 1 or 0 to the code based upon the branches

### Creating a Huffman Tree

- Initially, you have a list of leaf nodes containing the characters and their frequencies
  - The list of leaves is then sorted by frequency
  - Combine the two nodes with the lowest frequencies
  - Create a binary tree with the parent node containing the sum of frequencies of it's children
  - Sort the nodes and repeat until there's only one node left
- This requires a priority queue, and therefore can use a min-heap to represent the queue
  - Remove the two nodes with the lowst frequencies from the heap
  - Create a new internal node with the said nodes as its children and the sum of their frequencies as its frequency
  - Insert to the new node back into the min-heap
- The final remaining node is the root of the huffman tree