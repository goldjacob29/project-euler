structure Scan : sig

  val scan : string -> Token.token list
  (*val nextToken : char list -> (Token.token * char list) option*)

end = struct

(* Some helpful built-in operations: 
     explode : string -> char list
     implode : char list -> string
     Char.isUpper : char -> bool
     Char.isLower : char -> bool
     Char.isAlpha : char -> bool
     Char.isDigit : char -> bool
     Char.isSpace : char -> bool
*)
  fun getString cs = 
  	let
  		fun goodSeq (cs, acc) =
  			case cs
  		  of [] => (acc, [])
  		   | (c::cs') => if (Char.isAlpha c orelse Char.isDigit c) then
  		   						let
  		   							val (a,b) = (goodSeq (cs',acc))
  		   						in
  		   							((c::a), b)
  		   						end
  		   				else (acc,(c::cs'))
  	in
  		goodSeq(cs,[])
  	end



  fun nextToken cs = 
  	  (case cs
        of [] => NONE
         | #"{"::cs' => SOME(Token.LCURLY, cs')
         | #"}"::cs' => SOME(Token.RCURLY, cs')
         | #"("::cs' => SOME(Token.LPAR, cs')
         | #")"::cs' => SOME(Token.RPAR, cs')
         | #"<"::(#"-"::cs') => SOME(Token.LEFTARROW, cs')
         | #"."::cs' => SOME(Token.DOT, cs')
         | c::cs' => if not (Char.isAlpha c) then
         				if Char.isSpace c then
         					nextToken(cs')
         				else raise Fail "Scan Error: must start with alpha"
         	         else let
         	         	      val (a,b) = getString cs'
                          val a' = (c::a)
         	         	   in
         	         	   	  SOME(Token.ID(implode a'), b)
         	         	   end)

  fun scan source = 
  	let
  		fun lp [] = []
  		  | lp cs =
  		    (case nextToken cs
  		   of SOME(t,cs') => t::lp(cs')
  		    | NONE => [])
    in
    	lp(explode source)
    end

  


end
