{{/*
Expand the name of the chart.
*/}}
{{- define "tfa.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- $suffix := default "" .Suffix }}
{{- printf "%s-%s" $name $suffix | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tfa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tfa.labels" -}}
{{ include "tfa._labels" (merge (dict "Suffix" "") .) }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tfa._labels" -}}
helm.sh/chart: {{ include "tfa.chart" . }}
{{ include "tfa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tfa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
