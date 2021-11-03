package main

import (
	"encoding/json"
	"log"
	"net/http"
)

func main() {

	mux := http.DefaultServeMux

	mux.Handle("/ping", Ping())

	log.Fatal(http.ListenAndServe(":8000", mux))
}

func Ping() http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		json.NewEncoder(w).Encode("pong")
	})
}
