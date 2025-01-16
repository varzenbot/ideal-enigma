package main

import "net/http"

func handle_windows(w http.ResponseWriter, r *http.Request) {
	// read arguments from the path and build the response

	// read arg

	// build response
	output := "Hello, "
	for _, entry := range r.URL.Query() {
		output += entry[0] + ", "
	}
	output += "!"
	w.Write([]byte(output))
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, Web!"))
	})

	http.HandleFunc("/windows", handle_windows)
	http.ListenAndServe(":8080", nil)
}
