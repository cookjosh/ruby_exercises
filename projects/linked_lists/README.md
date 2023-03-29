## Linked lists project for The Odin Project
Info on project can be found [here](https://www.theodinproject.com/lessons/ruby-linked-lists).

### General information
I was a little stuck to start on really understanding how to reference the head node to start traversing until I saw this [Medium post](https://medium.com/analytics-vidhya/implement-a-linked-list-in-ruby-2aae925acd9c) that helped. The main realizations I had were:
- The author's `is_empty?` method helps us establish a condition and instance variable we can work against.
- We're not necessarily initializing a Node via its own class, but rather initiaing them through `append` or `preppend` (purposefully misspelled).
- Because of this we can initialize a head node by calling `#is_empty` and if `false`, create another instance var called `head` we can then use in conditional loops.

That was a huge help and having this click helped me write out all other methods on my own!

**Note** - Really removing all references to the object passed in `#pop`. Not having this is an issue if instantiating local variables for each Node instance, then referencing that variable. However it's not an issue if Node instances aren't referenced in code elsewhere.
