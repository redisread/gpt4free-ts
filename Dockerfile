FROM ghcr.io/puppeteer/puppeteer:20.5.0

USER root

WORKDIR /usr/src/build

COPY --chown=pptruser package.json /usr/src/build/

RUN npm i

COPY --chown=pptruser . /app  

WORKDIR /app

RUN npm run build

RUN mkdir /usr/src/app/
RUN cp ./dist/* /usr/src/app/ -r
RUN cp ./node_modules /usr/src/app/ -r 
RUN rm /usr/src/build -rf

EXPOSE 3000

CMD ["node", "index.js"]