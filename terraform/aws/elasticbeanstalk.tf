# ------------------------------------------------ #
# HydroServer Elastic Beanstalk Application        #
# ------------------------------------------------ #

resource "aws_elastic_beanstalk_application" "hydroserver_django_app" {
  name        = "hydroserver-${var.instance}"
  description = "HydroServer Django Application on Elastic Beanstalk"
}

# ------------------------------------------------ #
# HydroServer Elastic Beanstalk Environment        #
# ------------------------------------------------ #

resource "aws_elastic_beanstalk_environment" "hydroserver_django_env" {
  name                = "hydroserver-${var.instance}-env"
  application         = aws_elastic_beanstalk_application.hydroserver_django_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.3.2 running Python 3.11"

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "1"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "hydroserver-ec2-role-${var.instance}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ADMIN_EMAIL"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ALLOWED_HOSTS"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_STORAGE_BUCKET_NAME"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DATABASE_URL"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DEBUG"
    value     = "True"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DEPLOYMENT_BACKEND"
    value     = "aws"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DISABLE_ACCOUNT_CREATION"
    value     = "False"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "EMAIL_HOST"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "EMAIL_PORT"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "EMAIL_HOST_USER"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "EMAIL_HOST_PASSWORD"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_GOOGLE_CLIENT"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_GOOGLE_SECRET"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_HYDROSHARE_CLIENT"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_HYDROSHARE_SECRET"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_ORCID_CLIENT"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "OAUTH_ORCID_SECRET"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PROXY_BASE_URL"
    value     = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "SECRET_KEY"
    value     = ""
  }
}
