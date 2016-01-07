(*** Module that handles the process equation system representation ***)

exception WrongNumArgs of string
exception UndeclaredId of string

(***)

(*** Equation name type ***)

type eqname = 
    Fn of string
  | In of int
  | Rn of int
  | Pn of int

(*** Equation variable type ***)

type eqvar = int

(*** Action type ***)

type action_type = Out_type | Inp_type


(*** Action type ***)

type test_type = Equals_type | Differs_type

(*** Action prefix and continuation type ***)

type act = action_type * eqname * eqname list * eqvar * eqname list

(*** Internal action and continuation type ***)

type tau = eqvar * eqname list

(*** Test prefix and continuation type ***)

type test = test_type * eqname * eqname * eqvar * eqname list

(*** Set of actions type ***)

type act_set = act array

(*** Set of tests type ***)

type test_set = test array

(*** Set of internal actions type ***)

type tau_set = tau array

(*** Sum type ***)

type sum = act list * tau list * test list

(*** Set of sums type ***)

type sum_set = sum list

(*** Equation type ***)

type equation =
    {num_pars: int;
     num_rests: int;
     num_fnouts: int;
     num_bnouts: int;
     num_fninps: int;
     num_bninps: int;
     num_tests: int;
     num_taus: int;
     fnouts: act_set;
     bnouts: act_set;
     fninps: act_set;
     bninps: act_set;
     tests: test_set;
     taus: tau_set;
     mutable sums: sum_set}

(*** Equation system type ***)

type eq_system = ((eqvar, equation) Hashtbl.t ref)

(*** Equation system free names type ***)

type eq_fns = ((eqvar, string list ref) Hashtbl.t ref)

(***)

(*** Tests if equation variable is the void variable ***)

val is_void_eqvar: eqvar -> bool

(*** Empty equation constructor ***)

val nil_eq: unit -> equation

(*** Empty equation system constructor ***)

val nil_env: unit -> eq_system

(*** Empty equation system free names constructor ***)

val nil_fns: unit -> eq_fns

(***)

(*** Returns the number of restrictions of the equation ***)

val count_rests: equation -> int

(*** Returns the number of parameters of the equation ***)

val count_pars: equation -> int

(*** Counts the number of actions of the equation ***)

val count_acts: equation -> int

(***)

(*** Prints equation variables ***)

val print_eqvar: eqvar -> unit

(*** Prints the equation system ***)

val print_nf: eq_system * eq_fns * eqvar * string list -> unit

(***)

(*** Builds the equation system out of a Piastnode representation ***)

val normalform: 
    string -> string list -> Piastnode.ast_env -> eq_system * eq_fns * eqvar * string list

(***)
