(*** Module that handles the generation of bound and fresh names ***)

(*** Determines if a string corresponds to a bound name ***)

val is_bname: string -> bool

(*** Returns a new bound name ***)

val gen_bname: unit -> string

(*** Generates a fresh name ***)

val fresh_name: unit -> string

(*** Generates a list of fresh names ***)

val fresh_names: int -> int -> string list

(***)
