FROM node:18 AS server-build

WORKDIR /root/api

COPY api/package*.json ./
RUN npm install

COPY api/ ./

COPY --from=ui-build /usr/src/app/my-app/build ../my-app/build

EXPOSE 3080

CMD ["node", "server.js"]