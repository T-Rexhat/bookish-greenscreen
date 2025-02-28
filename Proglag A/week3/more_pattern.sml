fun nondecreasing xs = (* int list -> bool *)
    case xs of
	[] => true
      | x :: [] => true
      | head ::(neck::rest) => head <= neck andalso nondecreasing (neck::rest)

								  
datatype sgn = P | N | Z
			   
fun multsign (x1,x2) = (* int * int -> sgn *)
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
	case (sign x1, sign x2) of
	    (Z,_) => Z
	  | (_,Z) => Z
	  | (P,P) => P
	  | (N,N) => P
	  | (N,P) => N
	  | (P,N) => N 

    end
	
fun len xs =
    case xs of
	[] => 0
      | _ :: xs' => 1 + len xs'

fun sum_list xs =
    case xs of
	[] => 0
     | x :: xs' => x + sum_list(xs') 
			    
