FROM node:18

WORKDIR /app
COPY . .

RUN npm install && npm rebuild esbuild


EXPOSE 5173
CMD ["npm", "run", "dev"]
