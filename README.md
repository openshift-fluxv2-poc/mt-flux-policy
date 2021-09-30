# OPA Policy for Flux multi-tenancy

This is a Rego-based OPA policy to support Flux multi-tenancy enforcement.
Tested on OpenShift 4.8.

This policy enforces the following rules.

1. {Kustomization, HelmRelease}'s `spec.targetNamespace` must be specified.

![Selection_442](https://user-images.githubusercontent.com/10666/135507175-271e7c27-ebb2-471d-ad72-79445b249a3e.png)
