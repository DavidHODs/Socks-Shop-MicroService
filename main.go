package main

import (
	"database/sql"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

var db *sql.DB

type dataStruct struct {
	Name    string
	Email   string
	Comment string
}

// GET renders the html page, POST inserts form record into the database
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

		stmt := `insert into record(name, comment) values($1, $2)`
		_, err = db.Exec(stmt, "Jake", "rooting for you")
		if err != nil {
			fmt.Println(err)
		}

		// renders and passes data to the template file
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
	// loads static files to be rendered
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
