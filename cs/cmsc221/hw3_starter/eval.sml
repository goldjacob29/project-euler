structure Eval : sig

  val evalSteps : AST.term -> AST.term list
  val eval      : AST.term -> AST.term

end = struct

  structure A = AST

  val freshIndex = ref 0

  fun freshVarName () = 
    let
      val i = !freshIndex
      val hash_i = "#" ^ Int.toString i
      val _ = freshIndex := (i+1)
    in
      hash_i
    end

  fun eval t = raise Fail "todo: Eval.eval"

  fun evalSteps t = raise Fail "todo: Eval.evalSteps"

end


(*  datatype term
    = Var of string
    | Abs of string * term
    | App of term * term*)
