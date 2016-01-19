FROM ubuntu
MAINTAINER Ethan Buchman <ethan@coinculture.info>

RUN apt-get update

# ocaml to build slmc
RUN apt-get install -y ocaml

# tools
RUN apt-get install -y vim screen rlwrap

# git
RUN apt-get install -y git

# user
ENV USER slmc-user
ENV HOME /home/$USER
RUN groupadd --system $USER \
  && useradd --system --create-home --uid 1000 --gid $USER $USER

# configure screen to be like bash
RUN echo "defshell -bash" > $HOME/.screenrc

ENV SLMCDIR $HOME/slmc
RUN mkdir $SLMCDIR
COPY . $SLMCDIR
WORKDIR $SLMCDIR/sl-mc-v2.01

# build the slmc (see compile_w.w)
RUN ocamllex mclexer.mll \
 && ocamlyacc mcparser.mly \
 && ocamlc -c namegen.mli piastnode.mli ccastnode.mli equations.mli process.mli iterator.mli formastnode.mli mcmenu.mli checker.mli mcparser.mli \
 && ocamlc -o /usr/bin/slmc namegen.ml piastnode.ml ccastnode.ml equations.ml process.ml iterator.ml formastnode.ml checker.ml mclexer.ml mcparser.ml mcmain.ml

RUN chown --recursive $USER:$USER $HOME

WORKDIR $SLMCDIR
USER $USER
CMD ["/bin/bash"]
