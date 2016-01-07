(*** Module that handles the abstract syntactic tree representation for formulas ***)

exception Ill_formed_form

(*** Label type ***)

type lab = 
    OutLab of string * string list
  | InpLab of string * string list

(*** Number of components formula variants ***)

type numCompsType = EqNum | GtNum | LtNum

(*** Abstract syntactic tree for formulas type ***)

type formastnode = 
    True
  | False
  | Void
  | NumComps of int * numCompsType
  | Eq of string * string
  | Neq of string * string
  | Comp of formastnode * formastnode 
  | Decomp of formastnode * formastnode
  | Not of formastnode
  | And of formastnode * formastnode
  | Or of formastnode * formastnode
  | Implies of formastnode * formastnode
  | Equiv of formastnode * formastnode
  | Reveal of string * formastnode
  | RevealAll of string * formastnode
  | Fresh of string * formastnode
  | Free of string
  | Hidden of string * formastnode
  | MayTau of formastnode
  | AllTau of formastnode
  | MayLab of lab * formastnode
  | AllLab of lab * formastnode
  | MayOutN of string * formastnode
  | MayInpN of string * formastnode
  | AllOutN of string * formastnode
  | AllInpN of string * formastnode
  | MayOut of formastnode
  | MayInp of formastnode
  | AllOut of formastnode
  | AllInp of formastnode
  | MayN of string * formastnode
  | AllN of string * formastnode
  | May of formastnode
  | All of formastnode
  | Exists of string * formastnode
  | ForAll of string * formastnode
  | MaxFix of string * string list * formastnode * string list
  | MinFix of string * string list * formastnode * string list
  | Eventually of formastnode
  | Always of formastnode
  | Inside of formastnode
  | Show_f of formastnode
  | Show_s of formastnode
  | PropVar of string * string list
  | Abbrev of string * formastnode list

(*** Declaration type ***)

type declaration = Dec of ((string * string list * string list) * formastnode)

(***)

(*** Prints a formula ast to stdout ***)

val print_form: formastnode -> unit

(*** Prints a formula ast to stdout regarding a name substitution environment ***)

val print_form_subst: formastnode -> (string,string) Hashtbl.t ref -> unit

(*** Computes the set of free names and free propositional variables of a formula ast ***)

val formFN: formastnode -> (string,string) Hashtbl.t ref -> string list * string list

(*** Returns the formula ast, the free names and the free propositional variables regarding a name substitution ***)

val subst: formastnode -> (string,string) Hashtbl.t ref -> (formastnode * string list * string list)

(***)
