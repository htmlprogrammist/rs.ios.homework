# Players Separator

There are `n` basketball players in a row (think of it as an array, where each index of the array is a separate player). Each of the players has a personal score rating.

You have to form a team of 3 players amongst them under the following rules:

- Choose 3 players with index (`i, j, k`) with rating (`ratingArray[i], ratingArray[j], ratingArray[k]`).
- Each team must meet one of the conditions: (`ratingArray[i] < ratingArray[j] < ratingArray[k]`) or (`ratingArray[i] > ratingArray[j] > ratingArray[k]`) where (`0 <= i < j < k < n`).
- All the numbers in `ratingArray` are **unique**.

It is necessary to return the number of teams that can be formed taking into account the above conditions (players can be part of several teams).

## Example 1

**Input: [3, 6, 4, 5, 2]**  

**Output: 3** 

Because we can form three teams given the conditions. (3, 4, 5), (6, 5, 2), (6, 4, 2)

## Example 2

**Input: [3, 2, 4]**  

**Output: 0** 

Because we can't form any team given the conditions.

## Example 3

**Input: [5, 6, 7, 8]**  

**Output: 4** 

Four teams can be formed.  (5, 6, 7), (6, 7, 8), (5, 6, 8), (5, 7, 8)





