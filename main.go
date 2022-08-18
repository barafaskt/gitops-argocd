package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("Hello Argo using Go WebServer")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("<h1>Hello GithubActions!!!</h1>"))
	})
	http.ListenAndServe(":8080", nil)
}
