structure Check : sig

  val expect   : ''a * ''a * string -> unit
  val expectBy : ('a * 'a -> bool) -> 'a * 'a * string -> unit
  val within   : real -> real * real * string -> unit
  val error    : (unit -> 'a) * string -> unit

end = struct

  fun msg s m = "Check." ^ s ^ " failure: " ^ m

  fun expect (x : ''a, y : ''a, m : string) : unit =
      if x=y then () else raise Fail (msg "expect" m)

  fun expectBy (eq : 'a * 'a -> bool) (x : 'a, y : 'a, m : string) : unit =
      if eq(x,y) then () else raise Fail (msg "expectBy" m)

  fun within (eps : real) (x : real, y : real, m : string) : unit =
      if abs(x-y)<=eps then () else raise Fail (msg "within" m)

  fun error (compute : unit -> 'a, m : string) : unit =
    let
        val x = SOME (compute ()) handle _ => NONE
    in
        case x
         of NONE => ()
          | SOME _ => raise Fail (msg "error" m)
    end

end
