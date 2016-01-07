(*** Module that implements the model checking algorithm ***)

exception Undeclared of string
exception Wrong_args of string
exception ErrorMsg of string
exception UnguardedRec of string
exception MaxThreads

(***)

(*** Prints the declared processes to stdout ***)

val print_procs: unit -> unit

(*** Installs the process declaration ***)

val install_proc: Mcmenu.processdec -> unit

(*** Prints the declared formulas to stdout ***)

val print_props: unit -> unit

(*** Installs the formula declaration ***)

val install_prop: Formastnode.declaration -> unit

(*** Calls the model checking procedure given a formula and a process identifier and arguments ***)

val top_check: (string * string list * Formastnode.formastnode) -> unit

(*** Clears all declarations ***)

val clear: unit -> unit

(*** Updates the trace parameter value ***)

val trace: bool -> unit

(*** Prints the trace parameter value ***)

val trace_val: unit -> unit

(*** Prints a process to stdout ***)

val show_proc: string -> unit

(*** Prints a formula to stdout ***)

val show_prop: string -> unit

(*** Updates the maxthreads parameter value ***)

val def_maxthreads: int -> unit

(*** Prints the maxthread parameter value ***)

val show_maxthreads: unit -> unit

(*** Updates the checkcounter parameter value ***)

val def_checkcounter: bool -> unit

(*** Prints the checkcounter parameter value ***)

val checkcounter_val: unit -> unit

(*** Updates the showtime parameter value ***)

val def_showtime: bool -> unit

(*** Prints the showtime parameter value ***)

val showtime_val: unit -> unit

(***)
