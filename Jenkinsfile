pipeline {
    agent any

    environment {
         AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_DIR                = 'pipeline'   // path inside repo where main.tf is stored
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/nikhilgaur18/pipeline.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh """
                cd ${TF_DIR}
                terraform init
                """
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                cd ${TF_DIR}
                terraform plan -out=tfplan
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                cd ${TF_DIR}
                terraform apply -auto-approve tfplan
                """
            }
        }

        stage('Show EC2 Public IP') {
            steps {
                sh """
                cd ${TF_DIR}
                terraform output ec2_public_ip || true
                """
            }
        }
    }

    post {
        always {
            echo "✅ Pipeline execution finished!"
        }
    }
}
