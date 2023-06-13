# build step
FROM node:18-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
# copy over build folder from build phase
COPY --from=builder /app/build /usr/share/nginx/html
