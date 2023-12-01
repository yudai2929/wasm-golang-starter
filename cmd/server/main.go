package main

import (
	"fmt"
	"net/http"
)

func main() {
	port := ":8080"

	fmt.Printf("Listening on port %s\n", port)
	fmt.Printf("Open http://localhost%s in your browser\n", port)

	err := http.ListenAndServe(port, http.FileServer(http.Dir("public")))
	if err != nil {
		panic(err)
	}

}
