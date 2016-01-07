(*** Module that handles the search algorithms for process inspections ***)

(***)

exception No_more_comps

exception No_more_reveals

exception No_more_reacts

(***)

(*** Iterator type for composition ***)

type comp_it 

(*** Iterator type for revelation ***)

type reveal_it 

(*** Reaction label type ***)

type react_label = 
    Tau 
  | Lab of Process.label 
  | Name of string * Equations.action_type
  | Action of Equations.action_type

(*** Iterator type for reactions ***)

type react_it 

(***)

(*** Returns the composition iterator ***)

val comp: Process.process -> comp_it

(*** Returns the iterator's next composition of processes ***)

val next_comp: comp_it -> Process.process * Process.process

(*** Returns the revelation iterator ***)

val reveal: Process.process -> string -> reveal_it

(*** Returns the iterator's next revelation process ***)

val next_reveal: reveal_it -> Process.process

(*** Returns the reaction iterator ***)

val react: Process.process -> react_label -> react_it

(*** Returns the next reaction process ***) 

val next_react: react_it -> Process.process

(***)
