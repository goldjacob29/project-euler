structure AST = struct

  datatype term
    = Var of string
    | Abs of string * term
    | App of term * term

  datatype program
    = Program of ((string * term) list) * term

end
