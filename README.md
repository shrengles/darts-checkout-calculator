## Darts Calculator
# Calculate what darts are required for a given an input
# Example
To win, we must always end on a double, so those are our base cases.
Given a score of  40: D20
The Bull is also considered a double.

From there we can find the finish needed on a larger score by taking the remainder.

e.g given a score of 48, we can do: 8 D20

As the numbers increase in size, we take off larger chunks.

Given a score of 112: T20 12 D20
