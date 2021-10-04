# OPA Policy for Flux multi-tenancy

This is a Rego-based OPA policy to support Flux multi-tenancy enforcement.
Tested on OpenShift 4.8.

## How to run unit test

```bash
# Install OPA cli via Homebrew
$ brew install opa

# Test every Rego files under the gatekeeper dir, ignore all YAML files, explain fail cases
$ opa test --ignore='*.yaml' --explain=fails gatekeeper/

data.fluxmultitenancy.test_input_valid_helmrelease: PASS (1.795418ms)
data.fluxmultitenancy.test_input_invalid_helmrelease_no_namespace: PASS (1.535869ms)
data.fluxmultitenancy.test_input_invalid_helmrelease_namespace_not_same_as_target_namespace: PASS (1.216364ms)
data.fluxmultitenancy.test_input_invalid_helmrelease_no_service_account_name_defined: PASS (3.470131ms)
data.fluxmultitenancy.test_input_invalid_helmrelease_no_target_namespace_defined: PASS (824.879µs)
data.fluxmultitenancy.test_input_valid_kustomization: PASS (632.87µs)
data.fluxmultitenancy.test_input_invalid_kustomization_no_namespace: PASS (622.671µs)
data.fluxmultitenancy.test_input_invalid_kustomization_namespace_not_same_as_target_namespace: PASS (809.619µs)
data.fluxmultitenancy.test_input_invalid_kustomization_no_service_account_name_defined: PASS (667.91µs)
data.fluxmultitenancy.test_input_invalid_kustomization_no_target_namespace_defined: PASS (657.749µs)
--------------------------------------------------------------------------------
PASS: 10/10
```

## Enforcement

This policy enforces the following rules.

1. {Kustomization, HelmRelease}'s `spec.serviceAccountName` must be specified.

<img src="https://user-images.githubusercontent.com/10666/135507375-d3adc223-095f-4969-999d-a5b5c9f2e996.png" width="600">


2. {Kustomization, HelmRelease}'s `spec.targetNamespace` must be specified.

<img src="https://user-images.githubusercontent.com/10666/135507175-271e7c27-ebb2-471d-ad72-79445b249a3e.png" width="600">


3. {Kustomization, HelmRelease}'s `spec.targetNamespace` must be the same as the object's namespace.

<img src="https://user-images.githubusercontent.com/10666/135507453-df01bf8f-9563-4c92-b2ab-6b6875c09977.png" width="600">
