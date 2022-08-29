CS166 - A Data Structures Library for Racket
===

CS166, or `cs166`, is a shareable library for the [Racket](https://racket-lang.org/) programming language. The goal is to provide a library that implements many traditional classical computer science data structures. The name is picked after Stanford's [CS166 Data Structures](http://web.stanford.edu/class/cs166/) course.

## Data Structures

### Linked Lists

Linked Lists are fully implemented in Racket, but the naive implementation is purely linked. Things like length of the list, or pointers to the end of the list, are not implemented. A separate Linked List implementation is included which introduces a general form Linked List for any data type to provide a better Linked List interface.

### Binary Trees

Binary trees are a source of pain with regards to traversal, removal, zippers and balancing. A binary tree implementation is contained to reduce user burden.

### Queues

A purely functional implementation of a Queue is contained. A Queue is a front-and-back type data structure with two running lists to contain data. When one list runs out of items, the other list is reversed and swapped.

### Graphs

Graphs are a relationship-type structure using an immutable hash to establish the relationships between vertices. Graphs can be directed or bidirectional, and includes the ability to add weighted relationships to establish things like distance between vertices or other relationship properties.

### Heaps

Heaps are balanced list collections where some assertion about the values is mainted, typically named as Min/Max/Priority heaps. Simlar to binary trees.

### And More

k-trees, folds, zippers, and more to come.

## How to Use

`cs166` is a general library wrapper, you simply require it and constrain the imports you want to define. If you want all tree structures, you can do:

```racket
(require cs166/trees)
```

That will include all trees, but can be further constrained by targeting an exact module.

```racket
(require cs166/trees/binary)
```


## Macros

In some cases, macros are provided to make it even easier to write some data structures. In most cases, it is preferred to keep all data structures immutable, and as such, all functions that operate on some collection of data will return new collections entirely.

To create a graph where `A -> B` and `B -> C`, you might do something like:
```racket
(require cs166/graphs)

(define G (Graph:init))
(define G2
  (Graph:add-edges '((A . B) (B . C))))
```

The goal would be to be able to provide a macro that lets us define a Graph using syntax that feels better than that.

```racket
(require cs166/graphs)

(define/graph G
  (A -> B)
  (B -> C))
```

The latter has a more academic feel to it and feels more natural for creating graphs, and even binds the graph to whatever variable binding you would want to use with `define`.

Macros will only be defined where it reduces code and boilerplate code, like with regards to `#<hash>` types and checking for safety. They are entirely optional.
