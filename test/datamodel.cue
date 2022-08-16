package main

import (
	"github.com/hofstadter-io/hof/schema/dm"
	"github.com/hofstadter-io/hof/schema/dm/fields"
	"github.com/hofstadter-io/hof/schema/dm/sql"
)

Datamodel: dm.#Datamodel & {
	Name: "Petstore"

	Models: {
		User: {
			Fields: {
				ID: fields.UUID
				Name: Type:    "string"
			}

			Relations: {
				Pets: {
					Reln: "HasMany"
					Type: "Pet"
					Pointer: true
				}
			}
		}
		Pet: {
			Fields: {
				sql.#CommonFields
				Name: Type:    "string"
				Species: Type: "string"
			}

			Relations: {
				Owner: {
					Reln: "BelongsTo"
					Type: "User"
					Pointer: true
				}
			}
		}
	}
}
