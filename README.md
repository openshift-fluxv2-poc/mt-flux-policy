# OPA Policy for Flux multi-tenancy

This is a Rego-based OPA policy to support Flux multi-tenancy enforcement.
Tested on OpenShift 4.8.

This policy enforces the following rules.

1. {Kustomization, HelmRelease}'s `spec.serviceAccountName` must be specified.

![Selection_441](https://user-images.githubusercontent.com/10666/135507375-d3adc223-095f-4969-999d-a5b5c9f2e996.png | width=300)


2. {Kustomization, HelmRelease}'s `spec.targetNamespace` must be specified.

![Selection_442](https://user-images.githubusercontent.com/10666/135507175-271e7c27-ebb2-471d-ad72-79445b249a3e.png | width=300)


3. {Kustomization, HelmRelease}'s `spec.targetNamespace` must be the same as the object's namespace.

![Import YAML · Red Hat OpenShift Container Platform - Brave_440](https://user-images.githubusercontent.com/10666/135507453-df01bf8f-9563-4c92-b2ab-6b6875c09977.png | width=300)
