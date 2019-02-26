FROM ubuntu:16.04

RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt-get install --yes build-essential git python2.7 python-pip ruby

# Install CRF++
RUN git clone https://github.com/mtlynch/crfpp.git /crfpp
WORKDIR /crfpp
RUN ./configure && make && make install && ldconfig

# Install ingredient-phrase-tagger
RUN git clone https://github.com/NYTimes/ingredient-phrase-tagger.git \
      /ingredient-phrase-tagger
WORKDIR /ingredient-phrase-tagger
RUN python setup.py install && ./roundtrip.sh

