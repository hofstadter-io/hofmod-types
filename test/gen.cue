package main

import (
	"github.com/hofstadter-io/hofmod-types/generators/go"
	"github.com/hofstadter-io/hofmod-types/generators/py"
)


// add Datamodel to all generators
[!~"Datamodel"]: "Datamodel": Datamodel

Go: go.#Generator & {
	@gen(go)
	Outdir: "out/go"
}

Py: py.#Generator & {
	@gen(py)
	Outdir: "out/py"
}
