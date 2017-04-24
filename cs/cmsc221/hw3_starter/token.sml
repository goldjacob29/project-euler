structure Token = struct

  datatype token
    = ID of string
    | LCURLY
    | RCURLY
    | DOT
    | LPAR
    | RPAR
    | LEFTARROW

  fun tos (ID s) = s
    | tos LCURLY = "{"
    | tos RCURLY = "}"
    | tos DOT = "."
    | tos LPAR = "("
    | tos RPAR = ")"
    | tos LEFTARROW = "<-"

end

