{{/*
Expand the name of the chart.
*/}}
{{- define "budget-service.name" -}}
{{- default .Chart.Name .Values.budgetService.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "budget-service.fullname" -}}
{{- if .Values.budgetService.fullnameOverride }}
{{- .Values.budgetService.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.budgetService.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "budget-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "budget-service.labels" -}}
helm.sh/chart: {{ include "budget-service.chart" . }}
{{ include "budget-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "budget-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "budget-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "family-budget-website.name" -}}
{{- default "family-budget-service-website" .Values.familyBudgetWebsite.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "family-budget-website.fullname" -}}
{{- if .Values.familyBudgetWebsite.fullnameOverride }}
{{- .Values.familyBudgetWebsite.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "family-budget-service-website" .Values.familyBudgetWebsite.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "family-budget-website.chart" -}}
{{- printf "%s-%s" "family-budget-service-website" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "family-budget-website.labels" -}}
helm.sh/chart: {{ include "family-budget-website.chart" . }}
{{ include "family-budget-website.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "family-budget-website.selectorLabels" -}}
app.kubernetes.io/name: {{ include "family-budget-website.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
