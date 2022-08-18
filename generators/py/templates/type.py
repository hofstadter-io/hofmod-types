{{ $Model := .Model }}
from dataclasses import dataclass, field
from dataclasses_json import dataclass_json
from typing import List
import uuid


@dataclass_json
@dataclass
class {{ .Model.Name }}:

{{ range $i, $Field := .Model.OrderedFields -}}
{{ $In := dict "Field" $Field "Model" $Model }}
    {{ template "field.py" $In }}
{{ end }}

{{ range $i, $Reln := .Model.OrderedRelations -}}
{{ $In := dict "Reln" $Reln "Model" $Model }}
    {{ template "reln.py" $In }}
{{ end }}

