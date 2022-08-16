package go

import (
	"github.com/hofstadter-io/hofmod-types/generators/base"
)

#Generator: base.#Generator & {
	...
	lang: "go"

	// language specific config
	Package: string | *"types"
	In: {
		"Package": Package
	}
}
