(*** Module that holds the menu interface type ***)

type processdec =
  PIProcdec of Piastnode.dec 
| CCProcdec of Ccastnode.cc_dec

type menu = 
    Defproc of processdec
  | Defprop of Formastnode.declaration
  | Check of (string * string list * Formastnode.formastnode)
  | DefMaxThreads of int
  | PrintMaxThreads
  | DefCheckCounter of bool
  | PrintCheckCounter
  | DefShowTime of bool
  | PrintShowTime
  | ListParams
  | DefTrace of bool
  | PrintTrace
  | CD of string
  | PD
  | Load of string
  | Clear
  | ShowProc of string
  | ShowProp of string
  | PrintProcs
  | PrintProps
  | Help
  | Continue
  | Done

(***)
