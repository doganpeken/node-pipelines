FROM node:15
WORKDIR /app
COPY ./bff/package.json .
ARG NODE_ENV
RUN npm install
COPY . .
ENV PORT 3000
EXPOSE 3000
CMD ["node", "index.js"]