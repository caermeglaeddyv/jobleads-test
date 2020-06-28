{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the counter-app chart.
*/}}
{{- define "counter-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "counter-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "counter-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "counter-app.labels" -}}
chart: {{ include "counter-app.chart" . }}
{{- if .Values.image.tag }}
version: {{ .Values.image.tag }}
{{- end }}
managed-by: {{ .Release.Service }}
{{ include "counter-app.selectorLabels" . }}
{{- end -}}

{{/*
Common counter-app selector labels
*/}}
{{- define "counter-app.selectorLabels" -}}
project: jobleads-test
app: {{ .Release.Namespace }}
component: {{ include "counter-app.name" . }}
instance: {{ .Release.Name }}
{{- end -}}

{{/*
Common redis-ha selector labels
*/}}
{{- define "redis-ha.selectorLabels" -}}
project: jobleads-test
app: {{ .Release.Namespace }}
component: {{ include "redis-ha.fullname" . }}
instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "counter-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "counter-app.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.create }}
{{- end -}}
{{- end -}}
