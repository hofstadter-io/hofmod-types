package base

import (
	"github.com/hofstadter-io/hof/schema/dm"
	"github.com/hofstadter-io/hof/schema/gen"
)

#Generator: gen.#Generator & { ...

	// User inputs
	// Enforce common schema for all generators
	Datamodel: dm.#Datamodel
	Module: string
	FieldEnricher: _

	// todo, gen specific config...
	//   - language specific config
	//   - build system

	// Metadata set by generator author
	lang:   string
	ext:    string | *lang

	// pass user inputs to code gen
	In: {
		"Module": Module
		"Datamodel": Datamodel & {
			for m,M in Datamodel.Models {
				for f,F in M.Fields {
				 Models: (m): Fields: (f): (FieldEnricher & { field: F }).output
				}
			}
		}
	}

	// default gen input locations
	Templates: [{
		Globs: ["generators/\(lang)/templates/**/*"]
		TrimPrefix: "/generators/\(lang)/templates/"
	}]
	Partials: [{
		Globs: ["generators/\(lang)/partials/**/*"]
		TrimPrefix: "generators/\(lang)/partials/"
	}]
	Statics: [{
		Globs: ["generators/\(lang)/static/**/*"]
		TrimPrefix: "generators/\(lang)/static/"
	}]

	// default output files
	Out: [...] | *[
		for f in onceFiles { f },
		for f in typeFiles { f },
	]
	onceFiles: [...] | *[]
	typeFiles: [...] | *[for key, M in In.Datamodel.Models {
		TemplatePath: "type.\(ext)"
		Filepath: "\(key).\(ext)"
		In: {
			Model: M
		}
	}]
}
