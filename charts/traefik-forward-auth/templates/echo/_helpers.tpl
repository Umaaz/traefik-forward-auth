{{/*
Selector labels
*/}}
{{- define "tfa.selectorLabelsEcho" -}}
app.kubernetes.io/name: {{ include "tfa.name" . }}-echo
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tfa.labelsEcho" -}}
{{ include "tfa._labels" (merge (dict "Suffix" "echo") .) }}
{{- end }}