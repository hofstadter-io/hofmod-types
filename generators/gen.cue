package generators

import (
	"github.com/hofstadter-io/hof/schema/dm"
	"github.com/hofstadter-io/hof/schema/gen"

	"github.com/hofstadter-io/hofmod-types/generators/go"
)

// this is intended to provide
// a simplified interface
#Generator: gen.#Generator: {
	// User inputs
	// Enforce common schema for all generators
	Datamodel: dm.#Datamodel

	// per language configuration
	Langs: [string]: { ... }

	// add datamodel to all generators
	generators: [...{"Datamodel": Datamodel}]

	// create list of subgens
	generators: [
		if Langs.go != _|_ {
			go.#Generator & {
				Outdir: string | *"go"
				Langs.go
			}
		}
	]
}
