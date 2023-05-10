FROM node:16

# Set the working directory for the app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY ["package.json", "package-lock.json", "./"]

# Install the app's dependencies
RUN npm install --production

COPY . . 

# Expose the port the app will run on
EXPOSE 8080

# Start the app
CMD [ "npm", "start" ]