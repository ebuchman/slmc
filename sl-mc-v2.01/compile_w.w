ocamllex mclexer.mll
ocamlyacc mcparser.mly
ocamlc -c namegen.mli piastnode.mli ccastnode.mli equations.mli process.mli iterator.mli formastnode.mli mcmenu.mli checker.mli mcparser.mli
ocamlc -o sl-mc_w.exe namegen.ml piastnode.ml ccastnode.ml equations.ml process.ml iterator.ml formastnode.ml checker.ml mclexer.ml mcparser.ml mcmain.ml

