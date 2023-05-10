# FRONTEND APP
# Specify the base image
FROM node:16

# Set the working directory for the app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY ["package.json", "package-lock.json", "./"]

RUN npm install --production

# Install the app's dependencies
RUN npx browserslist@latest --update-db

COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Start the app
CMD [ "npm", "start" ]