# --- Build stage ---
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json pnpm-lock.yaml* package-lock.json* yarn.lock* ./
RUN npm i -g pnpm && pnpm install
COPY . .
RUN pnpm build   # hasil ke .output/

# --- Runtime stage ---
FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/.output /app/.output
COPY --from=builder /app/package.json /app/package.json
ENV NODE_ENV=production
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3000
EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]
