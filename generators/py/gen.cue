package py

import (
	PY "github.com/hofstadter-io/hof/schema/dm/enrichers:py"
	"github.com/hofstadter-io/hofmod-types/generators/base"
)

#Generator: base.#Generator & {
	...
	lang: "py"

	FieldEnricher: PY.#FieldEnricher

	// language specific config
	Package: string | *"types"
	In: {
		"Package": Package
	}
}

