FROM ubuntu
MAINTAINER Ethan Buchman

RUN apt-get update

# ocaml to build slmc
RUN apt-get install -y ocaml

# tools
RUN apt-get install -y vim screen rlwrap

# configure screen to be like bash
RUN echo "defshell -bash" > /root/.screenrc

RUN mkdir /slmc
COPY . /slmc
WORKDIR /slmc/sl-mc-v2.01

# build the slmc (see compile_w.w)
RUN ocamllex mclexer.mll \
 && ocamlyacc mcparser.mly \
 && ocamlc -c namegen.mli piastnode.mli ccastnode.mli equations.mli process.mli iterator.mli formastnode.mli mcmenu.mli checker.mli mcparser.mli \
 && ocamlc -o /usr/bin/slmc namegen.ml piastnode.ml ccastnode.ml equations.ml process.ml iterator.ml formastnode.ml checker.ml mclexer.ml mcparser.ml mcmain.ml

WORKDIR /slmc
CMD ["/bin/bash"]



