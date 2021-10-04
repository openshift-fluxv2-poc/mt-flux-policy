package fluxmultitenancy

test_input_valid_kustomization {
	obj = {
		"kind": {"kind": "Kustomization"},
		"object": {
			"metadata": {
				"name": "some-name", 
				"namespace": "default"
			},
			"spec": {
				"serviceAccountName": "foo",
				"targetNamespace": "default"
			},
		},
	}

	input := {"review": obj, "parameters": {}}
	results := violation with input as input
	count(results) == 0
}

test_input_invalid_kustomization_no_namespace {
	obj = {
		"kind": {"kind": "Kustomization"},
		"object": {
			"metadata": {
				"name": "some-name", 
			},
			"spec": {
				"serviceAccountName": "foo",
				"targetNamespace": "default"
			},
		},
	}

	input := {"review": obj, "parameters": {}}
	results := violation with input as input
	count(results) == 1
}

test_input_invalid_kustomization_namespace_not_same_as_target_namespace {
	obj = {
		"kind": {"kind": "Kustomization"},
		"object": {
			"metadata": {
				"name": "some-name",
				"namespace": "default",
			},
			"spec": {
				"serviceAccountName": "foo",
				"targetNamespace": "apps"
			},
		},
	}

	input := {"review": obj, "parameters": {}}
	results := violation with input as input
	count(results) == 1
}

test_input_invalid_kustomization_no_service_account_name_defined {
	obj = {
		"kind": {"kind": "Kustomization"},
		"object": {
			"metadata": {
				"name": "some-name", 
				"namespace": "default"
			},
			"spec": {
				"targetNamespace": "default"
			},
		},
	}

	input := {"review": obj, "parameters": {}}
	results := violation with input as input
	count(results) == 1
}

test_input_invalid_kustomization_no_target_namespace_defined {
	obj = {
		"kind": {"kind": "Kustomization"},
		"object": {
			"metadata": {
				"name": "some-name", 
				"namespace": "default"
			},
			"spec": {
				"serviceAccountName": "foo"
			},
		},
	}

	input := {"review": obj, "parameters": {}}
	results := violation with input as input
	count(results) == 1
}
