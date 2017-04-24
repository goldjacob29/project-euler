structure StaticCheck : sig

(* Check the following properties of the given program:
   - all abbreviations begin with a capital letter
   - all variables begin with a lowercase letter
   - all abbreviation names are distinct (no duplicates)
   - all abbreviations are bound to abstractions
   - no abbreviates are referred to before they are defined 
  Raise an exception if any of these properties are violated.
 *)

  val check : AST.program -> unit

end = struct

  (* CHECK CAPITAL *)
  (*fun checkCapHelp [] = true
    | checkCapHelp ((a,t)::abbs) = if Char.isUpper(hd(explode(a))) then
                                    checkCapHelp(abbs)
                                  else raise Fail
                                    "Static Check: Abbreviation does not begin with capital letter"
  fun checkCap p =
    case p
   of AST.Program(a,t) => checkCapHelp(a)*)

   fun startsWithUpper s = Char.isUpper(hd (explode s))

   fun checkAbbrevsUpper (AST.Program(abbrs, t)) = 
      if List.all startsWithUpper (List.map #1 abbrs) then
          true 
      else raise Fail "Static Check: Abbreviation name is not Capitalized"

                                

   (* CHECK LOWERCASE *)
   fun checkLowHelp' t =
      case t
    of AST.Var(s) => if Char.isLower(hd(explode(s))) then
                        true
                      else raise Fail
                        "Static Check: Variable name is not lowercase"
     | AST.Abs(_, t) => checkLowHelp'(t)
     | AST.App(t1, t2) => checkLowHelp'(t1) andalso checkLowHelp'(t2)

   fun checkLowHelp [] = true
     | checkLowHelp ((s,t)::ts) = checkLowHelp'(t) andalso checkLowHelp ts

   fun checkVarsLower p =
    case p
   of AST.Program(abbs,t) => checkLowHelp(abbs)
(*
   fun startsWithLower s = Char.isLower(hd (explode s))

   fun checkVarsLower (AST.Program(abbrs, t))*)


   (* CHECK DISTINCT *)

   fun checkDistinctHelp [] = true
     | checkDistinctHelp ((a,_)::abbs) = if (List.exists (fn x => String.compare(a,x) = EQUAL) (List.map #1 abbs)) then
                                              raise Fail "Static Check: Abbreviations are not distinct"
                                          else (checkDistinctHelp abbs)

   fun checkAbbrevsDistinct p =
      case p
    of AST.Program(cs,_) => checkDistinctHelp cs


    (* CHECK BOUND *)

    fun checkBoundHelp [] = true
      | checkBoundHelp ((_,AST.Abs(_,_))::abbs) = checkBoundHelp abbs
      | checkBoundHelp _ = raise Fail "Static Check: Abbreviation not bound to abstraction"


    fun checkAbbrevsBound p =
      case p
    of AST.Program(cs,_) => checkBoundHelp cs

    (* CHECK REFERENCE *)

    fun checkAbbrevsRef p = raise Fail "todo"




    fun toUnit true = ()
      | toUnit false = raise Fail "failure"

  fun check p = toUnit (checkAbbrevsRef p andalso checkAbbrevsBound p 
                andalso checkAbbrevsDistinct p andalso checkVarsLower p 
                andalso checkAbbrevsUpper p)


end
