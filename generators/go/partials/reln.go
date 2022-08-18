{{- with .Reln -}}
{{- $Type := .Type -}}
{{- if .Pointer }}{{ $Type = (concat "*" $Type) }}{{ end -}}
{{- .Name }} {{/* spacing */ -}}
{{- if eq .Reln "BelongsTo" }}{{ $Type }}{{ end -}}
{{- if eq .Reln "HasOne" }}{{ $Type }}{{ end -}}
{{- if eq .Reln "HasMany" }}[]{{ $Type }}{{ end -}}
{{- if eq .Reln "ManyToMany" }}[]{{ $Type }}{{ end -}}
{{- end }} `{{- template "reln-tags" . -}}`

{{- define "reln-tags" -}}
{{- template "reln-tags-json" . -}}
{{- end -}}

{{- define "reln-tags-json" -}}
json:"{{ camel .Reln.Name }},omitempty"
{{- end -}}
