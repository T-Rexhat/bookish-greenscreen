(* What is type inference?

type-checking reject a program before runs to prevent some errors
=> a feature of statically tuped languages

dynamically typed languages do little such checking

racket is a dynamically typed

ML (and Java, C#, Scala, C, C++) is statically typed
- every binding has one type, determined "at compile time"

ML is statically typed & implicityly typed: rarely need to write down types


 *)

fun f x = (* infer val f : int -> int *)
    if x > 3
    then 42
    else x * 2

fun g x = (* report type error then & else type should have the same type *)
    if x > 3
    then true
    else x * 2
		 
(*
type inference problem: give every binding/expression a type such that type-checking
succeeds
- fail if and only if no solution exists

*)
