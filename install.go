package main

import (
	"fmt"
	"os/exec"
)

func main() {
	fmt.Println("hello...")
	cmd := exec.Command("cp", "./emacs.d/init.el", "~/.emacs.d/")
	err := cmd.Start()
	if err != nil {
		fmt.Println("Error: ", err)
	}

	err = cmd.Wait()
	fmt.Println("Result: ", err)
}
