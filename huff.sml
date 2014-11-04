
structure Huffman = struct 
end

datatype 'a CodeTree = Leaf of 'a * int | Node of 'a CodeTree * 'a CodeTree 

fun ctFold fLeaf fNode ct  = 
    case ct of 
        Leaf (letter, weight) => fLeaf(letter, weight)
      | Node (left  , right ) => fNode(ctFold fLeaf fNode left, ctFold fLeaf fNode right)  

fun chars ct = ctFold (fn (l,_) => [l]) (op @) ct

val t = Node(Leaf(#"a",2), Node(Leaf(#"b",4), Leaf(#"c",3)))
val ct = chars t


