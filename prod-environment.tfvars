environment                  = "prod"
instance_type                = "t3.large"
ami                          = "ami-046d5130831576bbb"
region                       = "eu-west-2"
autoscaling_desired_capacity = 3
autoscaling_min_size         = 3
autoscaling_max_size         = 6