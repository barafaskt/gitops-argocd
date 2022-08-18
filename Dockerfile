FROM golang:1.19 as build
WORKDIR /app
COPY . .

# alterar o CGO(cross-compilation GO) para false que são libs do C
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server 

FROM scratch
WORKDIR /app
# copiar o arquivo server da imagem build para está scratch 
COPY --from=build /app/server . 
EXPOSE 8080
ENTRYPOINT ["./server"]
