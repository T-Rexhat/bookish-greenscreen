(*  Mutable references : will not be in HW*)

val x = ref 42
val y = ref 42
val z = x

val _ = x := 43

val w = !y + !z 		 
