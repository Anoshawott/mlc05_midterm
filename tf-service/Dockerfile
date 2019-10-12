FROM tensorflow/tensorflow:1.15.0rc1-py3
MAINTAINER Alan Blake

RUN apt-get -q -y install unzip
WORKDIR /tmp
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -fr awscli-bundle && \
    rm awscli-bundle.zip

WORKDIR /usr/local/bin

COPY \
  assets/go.sh \
  /usr/local/bin/

RUN chmod 755 \
  go.sh

CMD ./go.sh
