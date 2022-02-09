
# The base go-image
FROM golang:1.17-alpine
 
# Set environment variable
ENV APP_NAME docker-go-starter-template
ENV CMD_PATH main.go

# Create a directory for the app
RUN mkdir /app
RUN go get github.com/kataras/iris/v12@master
 
# Copy all files from the current directory to the app directory
COPY . /app
 
# Set working directory
WORKDIR /app

# Expose application port
EXPOSE 8081

# "go build" will build an executable file named server in the current directory
RUN go build -o server . 
 
# Run the server executable
CMD [ "/app/server" ]
