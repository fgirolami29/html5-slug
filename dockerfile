# Usa un'immagine di base che includa Node.js
FROM node:alpine

RUN mkdir -p /app
# Copia il resto del codice sorgente nel container
COPY ./app /app
# Imposta la directory di lavoro all'interno del container
WORKDIR /app


RUN apk add --no-cache git



# Installa le dipendenze
RUN npm install


#RUN npm install webpack webpack-cli webpack-dev-server --save-dev
RUN npm install bower -g

RUN npm install grunt grunt-cli -g

RUN bower install --allow-root

# Esponi la porta 3000 per il webpack-dev-server
EXPOSE 9092

# Avvia il webpack-dev-server quando il container viene avviato
CMD ["grunt"]
