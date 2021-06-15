FROM node:16-alpine as dependencies
WORKDIR /app            
COPY package*.json ./  
RUN npm install --only=production       

FROM dependencies as release
COPY . .                
EXPOSE 3000
ENTRYPOINT [ "npm", "run", "start" ]