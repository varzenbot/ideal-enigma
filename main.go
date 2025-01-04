package main

import "fmt"

func main() {
	output := "Hello, World!"

	window_min := 0
	window_size := 2
	output_size := len(output)
	for window_min+window_size <= output_size {
		window := output[window_min : window_min+window_size]
		fmt.Print(window + "_")
		window_min += window_size
	}
	if window_min < output_size {
		window := output[window_min:]
		fmt.Println(window)
	} else {
		fmt.Println()
	}
	fmt.Println(output)
}
