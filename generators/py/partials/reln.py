{{- with .Reln -}}
{{- $Type := .Type -}}
{{- if eq $Type "uuid" }}{{ $Type = "uuid.UUID" }}{{ end -}}
{{- .Name }}: {{/* spacing */ -}}
{{- if eq .Reln "BelongsTo" }}{{ $Type }}{{ end -}}
{{- if eq .Reln "HasOne" }}{{ $Type }}{{ end -}}
{{- if eq .Reln "HasMany" }}List[{{ $Type }}]{{ end -}}
{{- if eq .Reln "ManyToMany" }}List[{{ $Type }}]{{ end -}}
{{- end }}
