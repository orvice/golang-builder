FROM golang

COPY install.sh .
RUN ./install.sh