package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

type dataStruct struct {
	Name    string
	Email   string
	Comment string
}

func renderPage(res http.ResponseWriter, req *http.Request) {
	if req.Method == "GET" {
		page, err := template.ParseFiles("index.tmpl")
		if err != nil {
			http.Error(res, err.Error(), http.StatusInternalServerError)
		}

		data := []dataStruct{
			{
				Name:    "ff",
				Comment: "ff",
			},
			{
				Name:    "ff",
				Comment: "ff",
			},
			{
				Name:    "ff",
				Comment: "ff",
			},
		}

		err = page.Execute(res, data)

		if err != nil {
			return
		}
	}
}

func main() {
	var port int = 8000

	router := mux.NewRouter()

	router.HandleFunc("/", renderPage).Methods("GET")
	router.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir("./static"))))

	database()

	srv := &http.Server{
		Handler:      router,
		Addr:         fmt.Sprintf("127.0.0.1:%d", port),
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	fmt.Printf("listening on port %d\n", port)

	log.Fatal(srv.ListenAndServe())
}
