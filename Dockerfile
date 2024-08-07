FROM node:10

#Set the Working Directory
WORKDIR /app

#Copy the necessary files
COPY package.json ./

#Install dependencies
RUN npm install

# Copy src and bin directories
COPY src ./src
COPY bin ./bin

#Set environment variables
ENV SECRET_WORD=cloudQuest

#Command to run
CMD ["node", "src/000.js"]