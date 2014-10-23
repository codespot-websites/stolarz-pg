FROM dockerfile/nodejs
RUN npm install -g grunt-cli

COPY . /src
WORKDIR /src

RUN npm install
RUN grunt deploy

ENV PORT 3000
EXPOSE 3000
CMD grunt server
