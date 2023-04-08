# Knights Travails

This is my solution to the Knights Travails project from [The Odin Project](https://www.theodinproject.com/lessons/ruby-knights-travails)!

## Overview
Check the site for fine details but essentially find the shortest path for a Knight in Chess from one square to another. My solution is certainly not the most elegant but seems to be working with a few randomized test cases!

## Notes on my solution
The focus for me was on a few things:
- Using BFS for searching through nodes.
- Creating a graph of dependencies between nodes, in this case an array of arrays that included a) a given spot and b) an array of spots that it could legally move to.
- Practicing building classes and objects and using them within each other.

Originally I thought about creating possible legal moves on the fly, but in the spirit of some of the recent learning objectives (search algorithms and trees/graphs), I wanted to try to build some type of graph structure ahead of time and be forced to work through it.

I was also stuck for a little bit after the initial setup but got some inspiration from [this student's](https://github.com/qpongratz/knights-travails) realization that it might be effective to get to the ultimate end square and trace your way back. This led me to create each square as its own object that had a parent attribute I could trace back to the start.

