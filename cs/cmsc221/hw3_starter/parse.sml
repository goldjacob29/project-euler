structure Parse : sig

  val parse : Token.token list -> AST.program
  (*nextExp : Token.token list -> (AST.term * Token.token list) option*)

end = struct

   (*fun appHelp (ts) = raise Fail "todo"
     (case ts
     of [] => raise Fail "todo"
      | Token.ID(x)::Token.ID(y) => (Var x, Var y)
      | Token.LCURLY::Token.ID(x)::Token.DOT::ts => (AST.Abs(x, )))*)

(*   fun absHelp (ts) =
     (case ts 
     of [] => raise Fail "todo"
      | Token.ID(x)::Token.RCURLY::ts' => AST.Var(x)
      | Token.LCURLY::Token.ID(x)::Token.DOT::ts' => AST.Abs(x, absHelp ts')
      | _ => raise Fail "todo"

      )*)
   

   fun nextExp tokens = raise Fail "todo"

   (*	(case tokens
   		of Token.ID(x)::ts => SOME (AST.Var(x), ts)
   		 | Token.LCURLY::Token.ID(x)::Token.DOT::ts => SOME (AST.Abs(x, absHelp ts))
   		     parse abstraction including recursive call to this function
	     | Token.LPAR::ts => SOME(AST.App(appHelp ts), )
	     parse application 
	     | _ => raise Fail "todo: Parse.nextExp")*)


  fun parse tokens = raise Fail "todo: Parse.parse"
(*  	let
  		fun lp [] = []
  	in
  		body
  	end


  	fun scan source = 
  	let
  		fun lp [] = []
  		  | lp cs =
  		    (case nextToken cs
  		   of SOME(t,cs') => t::lp(cs')
  		    | NONE => [])
    in
    	lp(explode source)
    end*)

end


