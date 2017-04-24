structure Compile : sig

(* file consumes the name of a file containing a program *)
  val file : string -> unit

(* source consumes source code directly *)
  val source : string -> unit

(* compile and show all small steps in evaluation *)
  val fileSteps   : string -> unit
  val sourceSteps : string -> unit

end = struct

  fun println s = (TextIO.print s; TextIO.print "\n")

  fun check t  = (StaticCheck.check t ; t)

  val compile 
    = Eval.eval o Inline.inline o check o Parse.parse o Scan.scan

  val compileSteps 
    = Eval.evalSteps o Inline.inline o check o Parse.parse o Scan.scan

  fun source code =
    let
      val _      = (println "===> original program:" ; println code)
      val result = compile code
    in
      (println "===> evaluated program:";
       println (Unparse.unparse result);
       println "")      
    end

  fun sourceSteps code = 
    let
      val _      = (println "===> original program:" ; println code)
      val result = compileSteps code
    in
      (println "===> evaluation steps:";
       List.app (println o Unparse.unparse) result;
       println "")      
    end

  fun file filename = source (Read.file filename)
  fun fileSteps filename = sourceSteps (Read.file filename)

end
