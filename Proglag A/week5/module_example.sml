structure Rational1 =
struct
datatype rational = Whole of int | Frac of int * int
exception BadFrac

(* internal functions gcd and reduce not on slide *)
(* gcd and reduce help keep fractions reduced, but clients need not
know about them   *)

(* 
they _assume_ their inputs are not negative
*)	      

fun gcd (x,y) =
    if x = y
    then x
    else if x < y
    then gcd(x, y-x)
    else gcd(x,y)
	

fun reduce r =
    case r of
	Whole _ => r
      | Frac(x,y) =>
	if x = 0
	then Whole 0
	else let val d = gcd in
		 if d = y
		 then Whole(x div d)
		 else Frac(x div d, y div d)
	     end

(* when making a frac, we ban zero denominators *)		 
fun make_frac (x,y) =
    if y = 0
    then raise BadFrac
    else if y < 0
    then reduce(Frac(~x, ~y))
    else reduce(Frac(x,y))


(* using math properties, both invariants hold of the result assuming they hold 
of the arguments*)

fun add (r1,r2) =
    case (r1,r2) of
	(Whole i, Whole j) => Whole(i+j)
      | (Whole i, Frac(j,k)) => Frac(j+k*i, k)
      | (Frac(j,k), Whole i) => Frac(j+k*i, k)
      | (Frac(a,b), Frac(c,d)) => reduce (Frac(a*d + b * c, b * d))
(* given invariant, pritns in reduced form *)
fun toString r =
    case r of
	Whole i => Int.toString i
      | Frac(a,b) => (Int.toString a) ^ "/" ^ (Int.toString b)
end
    
					 
					 
				   
				   
				   


	       
	       
	     
	    
