cluster_name = "development-eks"

kubernetes_version = "1.33"

instance_types = [
  "t3.micro"
]

desired_size = 1

min_size = 1

max_size = 2
