{{ .Field.Name }} {{ .Field.GoType }} `{{- template "field-tags" . -}}`

{{- define "field-tags" -}}
{{- template "field-tags-json" . -}}
{{- end -}}

{{- define "field-tags-json" -}}
json:"{{ camel .Field.Name }}"
{{- end -}}
