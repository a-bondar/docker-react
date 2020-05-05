# Build phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# Run phase
FROM nginx
# Скопируй папку из фазы builder и положи ее по указанному адресу
COPY --from=builder /app/build /usr/share/nginx/html