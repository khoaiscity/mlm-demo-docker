FROM node:10-alpine

ENV APP_HOME /app
ENV NG_CLI_ANALYTICS ci

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

CMD echo BUILDING... \
  && npm install --no-color --silent --prefix admin-source/client \
  && npm run build --progress=false --no-color --prefix admin-source/client \
  && cd admin-source \
  && echo COMPRESSING... \
  && tar -czf $APP_HOME/build/admin.tar.gz server \
  && echo DONE!!!
