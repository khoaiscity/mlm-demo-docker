FROM node:10-alpine

ENV APP_HOME /app
ENV NG_CLI_ANALYTICS ci

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

CMD echo BUILDING... \ 
  && npm install --no-color --silent --prefix member-source/client \
  && npm run build --progress=false --no-color --prefix member-source/client \
  && cd member-source \
  && echo COMPRESSING... \
  && tar -czf $APP_HOME/build/member.tar.gz server \
  && echo DONE!!!
