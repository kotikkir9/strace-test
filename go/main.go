package main

import (
	"fmt"
	"io/ioutil"
)

var version string

func main() {
	data, err := ioutil.ReadFile("/mnt/c/Users/kiril/Desktop/strace/README.md")
	if err != nil {
		fmt.Println("Could not open file:", err)
		return
	}
	fmt.Print(string(data))
}
