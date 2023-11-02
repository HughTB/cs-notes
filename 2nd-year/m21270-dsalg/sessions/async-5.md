# Workshop 7 19:00 02/11/23

## Hierarchical Data Structures

- A collection of elements, where each element has a unique predecessor and multiple successors
- Basic terminology
  - Tree - A set of interconnected nodes without a loop
  - Root node - The first node which all nodes are related to
  - Branch - The link between two nodes
  - Subtree - A tree whos root node is within another tree
  - Leaf - A node with no sucessors
  - Degree of the node - How many successors it has
  - Level of the node - How many nodes are between this node and the root
  - Height or Depth - How many levels are there in the tree

### Binary Search Tree

- A tree in which every node has two or fewer successors
- A binary search tree is a binary tree in which the nodes in the left subtree precede the root and the nodes in the right follow the root
- All subtrees are also binary search trees
- Since the nodes on the left are smaller, and nodes on the right larger than the root, we can perform a recursive binary search on a binary search tree
  - Check if the root is the item
  - If the item is smaller, recurse on the left subtree
  - If the item is larger, recurse on the right subtree
  - Once you get to a node with no successors, the item is not in the tree
- To create a binary search tree, you start by inserting the initial item as the root
- To insert an item, you must search through the tree by checking if the item is larger or smaller than the node at each level, until you find any empty spot to place it
- To delete an item, you must first check how many successors it has
  - If the node is a leaf, it can just be removed
  - If the node has only one successor, the successor can replace the node
  - If the node has two successors, you take either the right-most item in the left subtree or the left-most item in the right subtree. Since these nodes may have successors, you have to recurse over the subtrees to ensure they are still BSTs
  - Since there are two options available, the deletion of a node with two sucessors usually has two correct answers so the implementation will need to pick between them
- A balanced binary search tree is one in which all leaf nodes are of the same degree
  - A balanced tree is important as it allows half of the items in the tree to be disregarded for each comparison

### Traversal of BSTs

- Depth First Traversal
  - Traverses the tree from the root to the most distant child before moving on to the second most distant child, etc
  - Usually implemented using a stack
  - Processes leaf by leaf
  - There are 3 orders in which this can be performed
    - Pre-Order - Read the node, then traverse the left subtree, then the right
    - In-Order - Traverse the left subtree, read the node, then traverse the right
    - Post-Order - Traverse the left subtree, then the right, then read the node
- Breadth First Traversal
  - Traverses the tree horizontally from the root to all of it's children, then to their children, etc
  - Usually implemented using a queue
  - Processes level by level
  - Usually outputs each level from left to right