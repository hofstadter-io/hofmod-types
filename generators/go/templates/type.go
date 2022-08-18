{{ $Model := .Model }}
package {{ .Package }}

import (
	"time"

	"github.com/google/uuid"
)

var _ = time.Time
var _ = uuid.UUID

type {{ .Model.Name }} struct {

{{ range $i, $Field := .Model.OrderedFields -}}
{{ $In := dict "Field" $Field "Model" $Model }}
{{ template "field.go" $In }}
{{ end }}

{{ range $i, $Reln := .Model.OrderedRelations -}}
{{ $In := dict "Reln" $Reln "Model" $Model }}
{{ template "reln.go" $In }}
{{ end }}

}
