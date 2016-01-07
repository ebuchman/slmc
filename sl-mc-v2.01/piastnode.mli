(*** Module that handles the abstract syntactic tree representation for processes ***)

exception Ill_formed_ast

(*** Action type ***)
type test = 
    Equals | Differs 

(*** Action type ***)
type action = 
    Input of string * string list
  | Output of string * string list
  | Tau

(*** Abstract syntactic tree for processes type ***)
type piastnode = 
    Void 
  | Par of piastnode ref * piastnode ref
  | Sum of piastnode ref * piastnode ref
  | New of string list * piastnode ref
  | Act of action * piastnode ref
  | Test of string * string * piastnode ref * test
  | Var of string * string list

(*** Declaration environment type ***)
type dec = Pidec of string list * string list list * (piastnode ref) list

(*** Process environment type ***)
type ast_env = (string, string list * piastnode ref) Hashtbl.t ref

(***)

(*** Computes the set of free names of a process ast ***)
val astFN: piastnode ref -> (string, int) Hashtbl.t ref -> unit

(*** Prints a process ast to stdout ***)
val print_ast: piastnode ref -> unit

(***)
