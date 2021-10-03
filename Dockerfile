FROM node:15
WORKDIR /app
COPY . .
ARG NODE_ENV
WORKDIR /app/bff
RUN npm install
ENV PORT 3000
EXPOSE 3000
CMD ["node", "index.js"]