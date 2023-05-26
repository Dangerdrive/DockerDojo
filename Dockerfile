FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y golang

#Set the working directory inside the container:
ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

#is best practice to copy the binary, and not the source code (unnecessary or unnefficient.)
COPY Hello /go/src/app

#Set the working directory inside the container:
WORKDIR /go/src/app

RUN go build -o app

CMD ["./app"]


#docker build -t image-name .
