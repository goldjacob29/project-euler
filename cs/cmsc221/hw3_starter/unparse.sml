structure Unparse : sig

  val unparse : AST.term -> string

end = struct
 
  fun unparse t = 
  	(case t
   of AST.Var s => s
    | AST.Abs (s, t') => s ^ " " ^ unparse t'
    | AST.App (t1, t2) => unparse t1 ^ " " ^ unparse t2)

end