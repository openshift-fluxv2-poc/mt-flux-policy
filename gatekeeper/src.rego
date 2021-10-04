package fluxmultitenancy

violation[{"msg": msg}] {
	is_ks_or_helm(input.review.kind.kind)
	check_namespace(input.review.object.metadata)
	msg := sprintf(`'%v' has to specify a namespace`, [input.review.kind.kind])
}

violation[{"msg": msg}] {
	is_ks_or_helm(input.review.kind.kind)
	check_service_account(input.review.object.spec)
	msg := sprintf(`'%v' has to specify a serviceAccountName`, [input.review.kind.kind])
}

violation[{"msg": msg}] {
	is_ks_or_helm(input.review.kind.kind)
	check_target_namespace(input.review.object.spec)
	msg := sprintf(`'%v' has to specify a targetNamespace`, [input.review.kind.kind])
}

violation[{"msg": msg}] {
	is_ks_or_helm(input.review.kind.kind)
	check_in_same_target_namespace(input.review.object.metadata, input.review.object.spec)
	msg := sprintf(`'%v' namespace and targetNamespace must be the same`, [input.review.kind.kind])
}

is_ks_or_helm(kind) {
	kind == "HelmRelease"
}

is_ks_or_helm(kind) {
	kind == "Kustomization"
}

check_service_account(spec) {
	spec.serviceAccountName == ""
}

check_service_account(spec) {
	not spec.serviceAccountName
}

check_target_namespace(spec) {
	spec.targetNamespace == ""
}

check_target_namespace(spec) {
	not spec.targetNamespace
}

check_namespace(metadata) {
	not metadata.namespace
}

check_namespace(metadata) {
	metadata.namespace == ""
}

check_in_same_target_namespace(metadata, spec) {
	metadata.namespace != spec.targetNamespace
}
