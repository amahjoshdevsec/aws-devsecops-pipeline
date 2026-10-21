resource "kubernetes_config_map_v1_data" "this" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode(
      concat(
        yamldecode(try(data.kubernetes_config_map_v1.aws_auth.data["mapRoles"], "[]")),
        [
          for role in var.roles : {
            rolearn  = role.rolearn
            username = role.username
            groups   = role.groups
          }
        ]
      )
    )
    mapUsers = yamlencode(
      concat(
        yamldecode(try(data.kubernetes_config_map_v1.aws_auth.data["mapUsers"], "[]")),
        [
          for user in var.users : {
            userarn  = user.userarn
            username = user.username
            groups   = user.groups
          }
        ]
      )
    )
  }

  force = true
}

