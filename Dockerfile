FROM ubuntu:16.04

RUN mkdir /hello
WORKDIR /hello
RUN echo "hello, world!" > hi.txt
