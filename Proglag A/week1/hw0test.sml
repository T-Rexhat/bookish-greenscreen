(* Homework0 Simple Test *)

(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
(* use ctrl x & s to save the file 
ctrl c & s to run the file*)

val test1 = double 17 = 34

val test2 = double 0 = 0

val test3 = triple ~4 = ~12

val test4 = triple 0 = 0

val test5 = f(12,27) = 324

(* You can add more tests here, for example you can uncomment the line below
by deleting the first two character and last two characters on the line *)

val test6 = triple ~1 = ~3

val test7 = double ~2 = ~4

val test8 = triple 2 = 10			    
			    
			  
			    
