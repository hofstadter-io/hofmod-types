package go

import (
	GO "github.com/hofstadter-io/hof/schema/dm/enrichers:go"
	"github.com/hofstadter-io/hofmod-types/generators/base"
)

#Generator: base.#Generator & {
	...
	lang: "go"
	
	FieldEnricher: GO.#FieldEnricher

	// language specific config
	Package: string | *"types"
	In: {
		"Package": Package
	}
}
