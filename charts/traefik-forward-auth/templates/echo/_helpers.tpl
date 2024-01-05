{{/*
Selector labels
*/}}
{{- define "tfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tfa.name" . }}-echo
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
