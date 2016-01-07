(*** Module that handles the top level process representation ***)

(*** Top level process type ***)

type process

(*** Top level process label type ***)

type label =  Equations.action_type * string * string list

(*** Top level process set type ***)

type process_set

(***)

(*** Prints a top level process ***)

val print_process: process -> unit

(*** Creates a top level process from an equation system ***)

val nf2process: Equations.eq_system * Equations.eq_fns * Equations.eqvar * string list  -> string list -> process

(*** Tests if a process has a determined free name ***)

val test_fn: process -> string -> bool

(*** Returns the set of free names of a process ***)

val free_names: process -> string list

(*** Returns the number of components of a process ***)

val num_comps: process -> int

(*** Determines if a process is empty ***)

val empty_proc: process -> bool

(*** Returns the number of actions of a process ***)

val total_acts: process -> int

(*** Builds a pair of processes by separating an existing one ***)

val extract_comps: process -> int list -> int -> int -> int -> process * process

(*** Builds a pair of processes by composing with the empty process ***)

val comp_empty: process -> bool -> process * process

(*** Returns the number of restrictions of a process component ***)

val nrests_comp: process -> int -> int

(*** Finds a component that holds restrictions ***)

val find_res: process -> int -> int

(*** Returns a process where a restricted name revelation has taken place ***)

val rev_comps: process -> int -> int -> string -> process

(*** Finds an action given the label and a starting point ***)

val find_label: process -> label -> int -> int -> bool array -> bool * int * int * (string * string) list

(*** Finds a restricted name component ***)

val find_rest: process -> int -> string -> int

(*** Finds a component that holds restrictions ***)

val find_rests: process -> int

(*** Returns a process where a transition on a given label has taken place ***)

val react_label: label -> int -> int -> process -> process

(*** Finds a synchronization in a free name ***)

val find_fn_tau: process -> int -> int -> int -> int -> bool * int * int * int * int

(*** Finds a synchronization in a bound name ***)

val find_bn_tau: process -> int -> int -> int -> bool * int * int * int

(*** Returns a process where an internal transition has taken place ***)

val react_tau: int -> int -> int -> int -> bool -> process -> process

(*** Returns the different number of arguments of communications in a given name ***)

val get_num_args: process -> string -> int list

(*** Finds a test prefix ready to fire ***)

val find_test: process -> int -> int -> bool * int * int

(*** Returns a process where a test firing transition has taken place ***)

val react_test: int -> int -> process -> process

(*** Finds a tau prefix ***)

val find_tau_pref: process -> int -> int -> bool * int * int

(*** Returns a process where a tau prefix firing transition has taken place ***)

val react_tau_pref: int -> int -> process -> process

(*** Handles bound name output revelation ***)

val find_new_pos: process -> int -> int -> int * int
 
(*** Finds an action given the subject name ***)

val find_name: process -> string -> Equations.action_type -> int -> int -> bool * int * int * (string * string) list

(*** Finds an action given the action type ***)

val find_action: process -> Equations.action_type -> int -> int -> bool * int * int * (string * string) list

(*** Returns a process where a transition on a subject name or action type has taken place ***)

val next_react_aux: process -> Equations.action_type -> int -> int -> process

(***)

(*** Creates a process set ***)

val create_pset: process -> string list -> process_set

(*** Adds a process to a process set ***)

val add_to_pset: process_set -> process -> string list -> unit

(*** Removes a process from a process set ***)

val remove_from_pset: process_set -> process -> string list -> unit

(*** Determines if there exists an equivalent process in the process set ***)

val exists_congruent_n: process -> string list -> process_set -> string list -> bool

(***)
