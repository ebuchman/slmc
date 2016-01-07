(*** Module that handles the abstract syntactic tree representation for processes ***)

(*** Abstract syntactic tree representation for CC processes ***)

exception Ill_formed_ast_cc

type direction = Here | Up

(*** Action type ***)
type ccaction = 
     CCInput of direction * string * string list
  |  CCOutput of direction * string * string list


(*** Abstract syntactic tree for cc processes type ***)
type ccastnode = 
    CCInact 
  | CCPar of ccastnode  * ccastnode 
  | CCSum of ccastnode list
  | CCCxt of string * ccastnode
  | CCThis of string * ccastnode
  | CCAct of ccaction * ccastnode
  | CCDef of string * ccastnode 
  | CCNew of string * string * ccastnode 
  | CCJoin of string * string * ccastnode
  | CCVar of string * string list
  | CCIfThenElse of ccastnode  * ccastnode

(*** Declaration environment type ***)
type cc_dec = Ccdec of string * string list * ccastnode 

val print_ccast: ccastnode -> unit

(*** Function that produces the translation of a CC process
into a Pi-calculus process ***)

val translate_ccast: ccastnode -> string -> string -> 
Piastnode.piastnode -> (Piastnode.piastnode ref)
