FROM openjdk:11

ARG USER="ant"
ARG HOME="/home/$USER/"

RUN useradd -m -u 1000 $USER && \
    curl -O https://www.antlr.org/download/antlr-4.12.0-complete.jar && \
    mv antlr-4.12.0-complete.jar /usr/local/lib/ant.jar && \
    apt-get update -y && \
    apt-get install build-essential ghostscript vim -y

WORKDIR $HOME
USER ant

RUN mkdir $HOME/workspace && \
    echo "alias antlr4='java -Xmx500M -cp "/usr/local/lib/ant.jar:$CLASSPATH" org.antlr.v4.Tool'" >> .bashrc && \
    echo "alias grun='java -Xmx500M -cp "/usr/local/lib/ant.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'" >> .bashrc

COPY scripts/* /usr/local/bin/

ENV CLASSPATH ".:/usr/local/lib/ant.jar"