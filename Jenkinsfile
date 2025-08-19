pipeline {
    agent any

    environment {
        TF_DIR = "."   // location of your Terraform files
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nikhilgaur18/pipeline.git'
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

