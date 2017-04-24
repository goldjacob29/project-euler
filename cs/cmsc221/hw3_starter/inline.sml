structure Inline : sig

(* Replace all abbreviations with copies of the abstractions they abbreviate. *)
  val inline : AST.program -> AST.term

end = struct


  	fun replace( (s,t1), t2) = 
  	    case t2
         of (AST.Var(s2))      => if s = s2 then t1 else AST.Var s2
          | (AST.Abs(s2,t2'))  => AST.Abs(s2,replace( (s,t1), t2'))
     	  | (AST.App(t21,t22)) => AST.App (replace ((s,t1), t21), (replace ((s,t1),t22)))


    fun replaceAllHelp ((s,t1), tl) =
        case tl
         of [] => []
          | ((s2,t)::ts) => (s2,replace ((s,t1),t)) :: replaceAllHelp ((s,t1),ts)

  	fun replaceAll (AST.Program(ts, t)) = 
  		let
  			val fst = hd ts
  		in
  			AST.Program ( (replaceAllHelp(fst, ts)), replace(fst,t))
  		end

    fun isolate (AST.Program(ts, t)) = AST.Program(tl ts, t)

  	fun inline (AST.Program(ts, t)) = 
  		case ts
  	     of ([]) => t
  	      | (ts) => let
			  	   	    val p = replaceAll (AST.Program(ts, t))
			  	    in
			  	   	    inline(isolate p)
			  	    end




end
