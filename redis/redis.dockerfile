FROM redis:6.2-alpine

RUN apk add --no-cache	tzdata

ENV TZ=America/Mexico_City