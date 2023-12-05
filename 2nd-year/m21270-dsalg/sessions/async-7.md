# {Workshop 10 and 11 Async}{11:00}{18/11/23}{Dalin Zhou}

## Two-Three Trees

- A two-three tree is a perfectly balanced tree in which
  - Each node contains one or two keys (a 2-node and 3-node respectively)
  - Every internal node has either two (for a 2-node) or three (for a 3-node) children
  - All leaves are on the same level, hence the tree is always balanced
- For each individual node,
  - The keys of all children in the left subtree are less than the first key
  - The keys of all children in the centre subtree are greater than the first key
  - If a right tree exists (making it a 3-node), the keys of all children in the centre subtree are less than the second key
  - The keys of all children in the right subtree are greater than the second key

### Searching

- A similar searching method is used to that of a BST
- Start at the root node, if the key it not in the root node, move to the only subtree it could be in and recurse
- You must compare with both keys of the node before moving to a subtree
- Since there can be 3 subtrees for each node, it is effectively a ternary search, rather than a binary search

### Inserting

- A similar insertion method is used to that of a BST
- Unlike a BST insertion, a new node is not created
- Use the same searching strategy to find where the key should be inserted, and then depending upon if the node is a 2-node or a 3-node, a different method is needed
- If the leaf node contains one key, the new key is inserted into the leaf and the insertion is finished
- If the leaf node contains two keys, a new space must be created
  - The two existing keys and the new key are of equal importance
  - The existing 3-node is split into two nodes, in this case node1 and node2
  - The smallest key is placed in node1 and the largest in node2
  - The remaining key (the middle key) is promoted to be the parent node
  - If the existing parent node is a 2-node, then the promoted key is inserted into the existing parent, and the references are set to node1 and node2
  - If the existing parent node is a 3-node, then the split and promote process is repeated until a new place is found for the promoted key. This may result in the creation of a new root node

### Deleting

- A similar deletion method is used to that of a BST
- The key to be deleted is either
  - In a leaf node
    - Which is removed, as for a normal BST
    - This leaves either a 2-node leaf or a hole in the tree
  - In an internal node
    - Which is replaced by it's In Order successor or predecessor, which will be in a leaf node, which is once again normal for a BST
    - This leaves either a 2-node leaf or a hole in the tree
- In either case, we end up with a 2-node leaf or a hole in the tree
  - A 2-node leaf can be left as is
  - A hole in the tree needs to be removed
- To remove the hole, you
  - Traverse the 2-3 tree upwards towards the root
  - The hole is propagated through the tree until it can be eliminated
- The hole is eliminated by either
  - Being absorbed into the tree
  - Being propagated to the root of the tree, which results in the node being removed and the height of the tree being reduced by one


## B Trees

- A B tree is a multi-way search tree which is optimised for reading directly from a disk
  - Each node represents a block or page of secondary storage
  - Accessing a node means reading the keys from secondary storage, which is expensive and slow. This means that we want to reduce the number of nodes as much as possible
- A B tree of order $n$ has the following properties
  - The root node has either no children, or between 2 and $n$ children
  - All internal nodes have between $\frac{n}{2}$ and $n$ children
  - All leaves are on the same level
  - Each node can store 1 less key than it has children
- This also means that a 2-3 tree is a B tree of order 3, and a BST a B tree of order 2
- For any given tree of order $n$ and height $h$, we can store $n^h - 1$ keys
  - e.g. a tree of order 10 and height 3 can store $10^3 - 1 = 1000 - 1 = 999$ keys

### Searching

- Start at the root node, and perform a binary search on the keys in the root noed
- If the key is found, we are finished
- If the node we are currently in is a leaft node, and the key is not found, then the key is not in the tree
- Otherwise, follow the required branch to the next node an repeat the process

### Inserting

- The tree is searched to find the leaf node in which the key should be inserted
- If the node is not full
  - Insert the key into the node in it's correct order
- If the node is full
  - The node is split in two and the middle key is promoted upwards to the parent
  - If the parent node is full, then the split and promote process is repeated until space is found, or a new root node is created

### Deleting

- Similar to the deletion method for a 2-3 tree
- If the key to be deleted is not in a leaf node, then the immediate predecessor or successor will be in a leaf node, which will replace the key to be deleted
- Therefore, you need to check if there will be enough items in the leaf node
- If more than the minimum number of keys will be left, you can delete the key
- If not, you cannot delete the item directly, and so must
  - Check adjacent leaf nodes and if possible move items between nodes
  - If there are no spare items in adjacent nodes, then nodes must be combined, possibly reducing the height of the tree

## B* Trees

- In a B* tree, all nodes except the root must be at least two thirds full, as opposed to a B tree where all other nodes must be half full
- The frequency of splitting a node is reduced by delaying a split
- When a node overflows
  - A split is delayed by redistributing the keys between the node and it's sibling
  - When a split is made, two nodes are split into three
- Items are redistributed by
  - Moving the median key into the root
  - Moving the remaining keys into the children of the root, half in each
  - This leaves room in both nodes for at least 1 additional key
- If both the node and it's sibling is full, a split occurs and a new node is created
- keys from the split node, it's sibling and the parent are distributed evenly between the now three nodes
- The two separating keys are put into the parent node so that it can have enough children
- This always leaves the child nodes two thirds full

## B** \& Bn Trees

- These forms of B trees allow the "fill factor" to be increased
- Some DBMSes will allow the user to select a fill factor anywhere between 0.5 and 1.0
- A B tree with a fill factor of 75% or $\frac{3}{4}$ is called a B** tree
- In general, a Bn tree is a B tree whose nodes are required to be $\frac{n + 1}{n + 2}$ full
- B* trees are much less used than B+ trees

## B+ Trees

- What if we need all of the data in a B tree to be presented in ascending order?
  - We can use an In Order traversal, but this requires accessing each page of data to be accessed
  - Or we can use a B+ tree
- In a B+ tree, only the leaf nodes contain the data associated with each key or index
- Leaf nodes
  - Contain a set of keys and their associated data
  - Are linked together in sequence
  - Stored in secondary storage
- Internal nodes and the root are stored in main memory, and
  - Contain only keys
  - Are used as an index to the leaf nodes
  - Are known as an index set
  - Are implemented as a B tree
- B+ trees are often used as an alternative to indexed-sequential files

### Inserting

- A new record is inserted into a leaf node following the same rules as a regular B tree
- Scan the index set to located the relevant leaf node
- If the leaf node has space, the record is inserted and the index set is unchanged
- If the leaf node is full
  - The leaf is split
  - The index set is updated to show the new leaf node
  - Records are distributed evenly between the old and new leaves
  - The first key of the second node is copied to the parent node, without it's data
  - If the parent node is not full, the key is inserted as usual
  - If the parent node is full, then the splitting process is performed as usual for a B tree

### Deleting

- If the deletion of the record does not cause an underflow, then delete the record
  - No changes are made to the index set, even if the record is also in the index set, as the key is still required to search through the B+ tree
- If the deletion of the record causes an underflow, delete the record and then either
  - Redistribute the records in the leaf and it's sibling(s), and update the index set
  - Delete the leaf and move the remaining records to it's sibling(s), and update the index set

### B+ Trees vs Indexed-Sequential Files

- Advantages of B+ trees
  - Automatically reorganises itself during insertions and deletions
  - Only small, local updates are required
  - The entire file does not need to be reorganised to maintain performance
- Disadvantages of B+ trees
  - Extra overhead for insertion and deletion operations
  - Space overhead for the index set
- Disadvantages of Indexed-Sequential files
  - Performance degrades as the file grows, as overflow blocks are required
  - Periodic reorganisation of the entire file is required to maintain performance