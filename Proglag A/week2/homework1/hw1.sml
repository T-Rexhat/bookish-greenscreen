(*first part is year, second part is a month, thrid part is days*)
type date = int * int * int

fun is_older (d1 : date, d2 : date) : bool =
    if #1 d1 < #1 d2
    then true
    else if #2 d1 < #2 d2
    then true
    else if #3 d1 < #3 d2
    then true
    else
	false

fun number_in_month (dates : date list, month: int) : int =
    if null dates
    then 0
    else
    let
	val rest = number_in_month(tl dates, month)
    in
	if #2 (hd dates) = month
	then rest + 1
	else
	    rest
    end

fun number_in_months (dates : date list, month: int list) : int =
    if null month
    then 0
    else
	number_in_month(dates, hd month) + number_in_months(dates, tl month)

fun dates_in_month (dates : date list, month: int) : date list =
    if null dates
    then []
    else
	let
	    val rest = dates_in_month (tl dates, month)
	in
	    if #2 (hd dates) = month
	    then hd dates :: rest
	    else
		rest
	end

(*use @ because appending two list. DO NOT USE ::*)
	    
	    
fun dates_in_months (dates : date list, months: int list) : date list =
    if null months
    then []
    else
	dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)


fun get_nth (s : string list, n : int) : string =
    if n = 1
    then hd s
    else
	get_nth(tl s, n-1)

fun date_to_string (date : date) : string =
    let
	val months = ["January", "February", "March", "April", "May", "June",
		      "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, #2 date) ^ " " ^
	Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end
	
	       
	    

fun number_before_reaching_sum (sum : int, al : int list) : int =
    if sum <= hd al
    then 0
    else 1 + number_before_reaching_sum(sum - hd al, tl al)


(*70 = 3 
1 year = 365 days = 12 month

(70/365)* 12 = 2.3 ~ month 3
we can use the number_before_reaching_sum()

 *)
(*theres no 0 in months, so hardcode a 1 in there*)

fun what_month (day : int) : int =
     let
	 val days_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
     in
	 number_before_reaching_sum(day, days_month) + 1
     end



fun month_range (day1 : int, day2 : int) : int list =
    if day1 > day2
    then []
    else
	what_month(day1) :: month_range(day1 + 1, day2)

fun oldest (dates : date list) : date option =
    if null dates
    then NONE
    else
	let
	    val old = oldest(tl dates)
	in
	    if not(isSome(old)) orelse is_older(hd dates, valOf(old))
	    then SOME (hd dates)
	    else old
	end


	
				       
    
	
							    
			       


	 
			      
	       
	       
	    
    
	    

	    
		    
		
		
	     

							   
