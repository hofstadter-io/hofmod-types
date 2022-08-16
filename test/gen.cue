package main

import (
	"github.com/hofstadter-io/hofmod-types/generators/go"
)


// add Datamodel to all generators
[!~"Datamodel"]: "Datamodel": Datamodel

Go: go.#Generator & {
	@gen(go)
	Outdir: "out/go"
}
