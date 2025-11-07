# Etapa 1: build
FROM node:20-alpine AS builder
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
# RUN npm install -g @nestjs/cli  # 👈 adiciona o Nest CLI

# Copia o restante do código (ignorando o que está em .dockerignore)
COPY . .
RUN npm run build

# Etapa 2: runtime
FROM node:20-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./
RUN npm install --omit=dev

EXPOSE 3000
CMD ["node", "dist/main.js"]
