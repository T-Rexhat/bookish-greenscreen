datatype mytype = TwoInts of int * int
		| Str of string
       | Pizza

(*
val a = Str "hi" -> Str "hi" : mytype
val b = Str -> fn : string -> mytype
val c = Pizza -> Pizza : mytype
val d = TwoInts(1+2, 3+4) -> TwoInts(3,7) : mytype
val e = a -> Str "hi" : mytype

*)
(*mytype -> int*)	     
fun f (x : mytype) =
    case x of
	Pizza => 3
      | Str s  => String.size s
      | TwoInts(i1,i2) => i1 + i2
(* | Pizza => 4; (* redundant case: error*) *)
				   (*fun g x = case x of Pizza => 3 *missing cases: warning*)

datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int
datatype id = StudentNum of int | Name of string * (string option) * string

type card = suit * rank (*adding two or more datatypes together*)
		       
type name_record = { student_num : int option,
		     first : string,
		     middle : string option,
		     last : string  }

		       
fun is_Queen_of_Spades (c : card) =
    #1 c = Spade andalso #2 c = Queen

fun is_Queen_of_Spades2 (c : card) =
    case c of
	(Spade, Queen) => true
      | _ => false
		 
val c1 : card = (Diamond, Ace)
val c2 : suit * rank = (Heart, Ace)
val c3 = (Spade, Ace) (*card*)
val c4 = (Ace, Spade)	     
									 
datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp

				     
fun eval (e : exp) =
    case e of
	Constant i => i
      | Negate e2  => ~ (eval e2)
      | Add(e1, e2) => (eval e1) + (eval e2)
      | Multiply(e1,e2) => (eval e1) * (eval e2) 

fun max_constant (e : exp) =
    let fun max_of_two (e1,e2) =
	    let val m1 = max_constant e1
		val m2 = max_constant e2
	    in Int.max(m1,m2) end
    in
	
    case e of
	Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1,e2) => max_of_two (e1,e2) 
      | Multiply(e1,e2) => max_of_two (e1,e2)
    end
	
							  


val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp

(*Recursive datatypes
Datatype bindings can describe recursive structures
- Have seen arithmetic expressions
- Now, linked lists:

 *)
			    
datatype my_int_list = Empty | Cons of int * my_int_list

val x = Cons(4, Cons(23, Cons(2008, Empty)))

fun append_my_list (xs,ys) : my_int_list =
    case xs of
	Empty => ys
      | Cons(x, xs') => Cons(x, append_my_list(xs', ys))

(*Options are datatypes
Options are just predefined datatype binding
- NONE & SOME are constructores, not just fn
- So use pattern-mathing not issome and valOf
*)

fun inc_or_zero intoption =
    case intoption of
	NONE => 0
      | SOME i => i + 1

(*create a sum_list using case pattern matching*)
fun sum_list xs =
    case xs of
	[] => 0
      | a :: xs' => a + sum_list xs'

(*create append list using case pattern matching*)
fun append (xs,ys) = (*xs = int * a' list*)
    case xs of
	[] => ys
     | c :: xs' => c :: append(xs', ys) 
			  
			  
(*create amt of items in the list using case pattern matching*)
fun num_list xs =
    case xs of
	[] => 0
      | x :: xs' => 1 + num_list(xs') 

fun sum_triple (x,y,z) =
    x + y + z

fun full_name {first = x, middle = y, last = z} =
    x ^ " " ^ y ^ " " ^ z

			    
(*
The truth about functions
in ML, every fn takes exactly one argument

what we call multi-argument fn are just fn takign one tuple argument, implemented
w/ a tuple pattern in the fn binding
- Elegant & flexible language design

-Enables cute & useful things you cannot do in JAVA

*)	

fun rotate_left (x,y,z) = (y,z,x)
fun rotate_right t = rotate_left(rotate_left t)

				
(*
we can nest patterns as deep as we want
- Just like we can nest expressions as deep as we want
- Often avoids hard-to-read, wordy nested case expressions

So the full meaning of pattern-matching is to compare a pattern against a value
for the "same shape" and bind variables to the "right parts"
- more precise recursive definition coming after examples

*)


exception ListLengthMismatch
				
fun zip3 list_triple =
    case list_triple of
		([],[],[]) => []
	  | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3) :: zip3(tl1, tl2, tl3)
	  | _ => raise ListLengthMismatch
		       
(*_ matching everything except both up the cases/patterns*)								     

(*always think about the base case

[(1,4,7),(2,5,8),(3,6,9)] -> ([1,2,3], [4,5,6], [7,8,9])

*)		       
fun unzip3 list_triple =
    case list_triple of
	[] => ([], [], [])
      | (a,b,c) :: tl => let val (l1,l2,l3) = unzip3 tl
			 in
			     (a::l1, b::l2, c::l3)
			 end
			     
				 
fun unzip4 list_four =
    case list_four of
	[] => ([], [], [], [])
      | (a,b,c,d) :: tl => let val (l1,l2,l3,l4) = unzip4 tl
			   in
			       (a::l1, b::l2, c::l3, d::l4)
			   end			       
				 
fun nondecreasing xs = (* int list -> bool *)
    case xs of
	[] => true
      | x :: [] => true
      | head :: (neck :: rest) => head <= neck andalso nondecreasing (neck :: rest)


datatype sgn = P | N | Z

fun multsign (x1,x2) = (* int * int -> sgn *)
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
	case (sign x1, sign x2) of
	    (Z,_) => Z
	  | (_,Z) => Z
	  | (P,P) => P
	  | (N,P) => N
	  | (P,N) => N
    end
	
(*count the lengths of the list using a fn len*)
	
fun len xs =
    case xs of
	[] => 0
      | x :: xs' => 1 + len(xs')
			   
