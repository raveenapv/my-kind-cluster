{{- define "microservices.namespace" -}}
{{- if .Values.namespace -}}
{{ .Values.namespace }}
{{- else -}}
{{ .Release.Namespace }}
{{- end -}}
{{- end }}

{{- define "microservices.selectorLabels" -}}
app.kubernetes.io/name: {{ .name }}
{{- end }}

{{- define "microservices.labels" -}}
{{- include "microservices.selectorLabels" (dict "name" .name) | printf "%s\n" -}}
{{- $global := .root.Values.globalLabels | default dict -}}
{{- range $key, $value := $global }}
{{ printf "%s: %s\n" $key $value }}
{{- end -}}
{{- end }}

