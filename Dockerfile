FROM cypress/browsers:latest

RUN mkdir /web-ui-amt

WORKDIR /web-ui-amt

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

CMD [""]
