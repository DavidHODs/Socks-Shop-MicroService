# resource "kubernetes_certificate_signing_request_v1" "kube-cert" {
#   metadata {
#     name = "kube-cert"
#   }
#   spec {
#     usages      = ["client auth", "server auth"]
#     signer_name = "kubernetes.io/kube-apiserver-client"

#     request = <<EOT
#     -----BEGIN CERTIFICATE REQUEST-----
#     MIHSMIGBAgEAMCoxGDAWBgNVBAoTD2V4YW1wbGUgY2x1c3RlcjEOMAwGA1UEAxMF
#     YWRtaW4wTjAQBgcqhkjOPQIBBgUrgQQAIQM6AASSG8S2+hQvfMq5ucngPCzK0m0C
#     ImigHcF787djpF2QDbz3oQ3QsM/I7ftdjB/HHlG2a5YpqjzT0KAAMAoGCCqGSM49
#     BAMCA0AAMD0CHQDErNLjX86BVfOsYh/A4zmjmGknZpc2u6/coTHqAhxcR41hEU1I
#     DpNPvh30e0Js8/DYn2YUfu/pQU19
#     -----END CERTIFICATE REQUEST-----
#     EOT
#   }

#   auto_approve = true
# }


# resource "kubernetes_secret" "kube-secret" {
#   metadata {
#     name = "kube-secret"
#   }
#   data = {
#     "tls.crt" = kubernetes_certificate_signing_request_v1.kube-cert.certificate
#     "tls.key" = tls_private_key.kube-cert.private_key_pem 
#   }
#   type = "kubernetes.io/tls"
# }