# Workshop 5 Async 10:00 12/10/23

## Sorting Algorithms

- Merge Sort
  - Recursively divide the list into two equal halves until there is only one element in each group
  - Merge the smaller lists into several larger ones, sorting as you go
  - Repeat the merging until you are left with only one sorted list
  - I don't really understand this step so might be a good idea to look up someone else's teaching when typesetting 🙂
  - On average, the Big-O is $O(n \log_2 n)$
- Quick Sort
  - Select an item from the array to be the pivot (this can be selected arbitrarily, or randomly)
  - Any elements which are smaller than the pivot are placed to it's left, and all larger elements to it's right
  - The pivot will always be placed in it's correct, final position
  - Then, recursively perform a quicksort on the two halves of the array (everything to the left and everything to the right of the pivot)
  - The best-case Big-O is $O(n \log_2 n)$, worst-case is $O(n^{2})$. On average, the Big-O is approximately $O(n \log_2 n)$
 
## Backtracking Algorithms

- A backtracking algorithm is one which attempts to search for a solution by constructing partial solutions, and checking if they're consistent with the requirements and limitations of the problem
- The algorithm takes partial solutions one step at a time, and if said step violates the requirements, it backtracks a step and tries again
- If nothing it can do from there works, it backtracks again until either it can find a suitable solution, or it has tested every option and deems the problem unsolvable
- Backtracking algorithms work especially well for problems which have a large solution space (lots of possible solutions) and very strict requirements, as many possible solutions can be eliminated quickly
