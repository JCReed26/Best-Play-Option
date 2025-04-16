FROM node:20-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Copy standalone output
RUN cp -r .next/standalone/* ./

EXPOSE 3000

CMD ["node", "server.js"]
