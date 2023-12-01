package main

import (
	"syscall/js"
)

func add(this js.Value, i []js.Value) interface{} {
	sum := i[0].Int() + i[1].Int()
	return js.ValueOf(sum)
}

func registerCallbacks() {
	js.Global().Set("add", js.FuncOf(add))
}

func main() {
	c := make(chan struct{}, 0)

	registerCallbacks()
	<-c
}
