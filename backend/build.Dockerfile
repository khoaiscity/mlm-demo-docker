FROM golang:1.15.0-buster

ENV APP_HOME /app

WORKDIR $APP_HOME

RUN mkdir -p $APP_HOME/go-space

ENV GOPATH /app/go-space

CMD cd /app/go-space \
  && echo running go get... && /usr/local/go/bin/go get github.com/smartblock/mlm-standard-api \
  && cd bin \
  && echo running go build... && /usr/local/go/bin/go build mlm-standard-api \
  && echo done!
