### Level 11 -> Level 12


**Goal**<br>
Connect to bandit11 and find out the password
- Stored in **data.txt**
- All lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions<br>
[Read ROT13](https://en.wikipedia.org/wiki/ROT13#:~:text=ROT13%20is%20a,autonym%20%22EBG13%22)<br>

| Plain  | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z |
|   ↓    | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ | ↓ |
| ROT13 | N | O | P | Q | R | S | T | U | V | W | X | Y | Z | A | B | C | D | E | F | G | H | I | J | K | L | M |


**Learnings**<br>
- To translet we need to use `tr`
- To implement ROT13 
    - `A-Z` becomes `N-ZM-A`
    - `a-z` becomes `n-zm-a`



**Outcome**<br>
Password to next level:: `7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4`