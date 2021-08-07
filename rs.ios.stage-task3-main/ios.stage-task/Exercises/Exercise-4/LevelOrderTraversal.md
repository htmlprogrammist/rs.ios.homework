# Binary Tree Level Order Traversal

Given a binary tree represented as array (preorder). Return level order traversal of the tree.

@Note: Trailing nulls are trimmed in array representation. 

## Example 1

**Given tree:**

```  
┌── 3
1
└── 2
```

**Preorder Traversal of Tree:**

`@[@1, @2, [NSNull null], [NSNull null], @3]` 

**Level Order Traversal:**

`@[@[@1], @[@2, @3]]`

## Example 2

**Given Tree:**
```
   ┌── 8
┌──7
│  │  ┌── 6
│  └──5
│     └── nil
4
│  ┌── 3
└──2
   └── 1
```
**Preorder Traversal of Tree:**

`@[@4,@2,@1,[NSNull null],[NSNull null],@3,[NSNull null],[NSNull null],@7,@5,[NSNull null],@6,[NSNull null],[NSNull null],@8]` 

**Level Order Traversal:**

`@[@[@4],@[@2,@7],@[@1,@3,@5,@8],@[@6]]`
