pipeline {
    agent any

   environment {
        AWS_ACCESS_KEY_ID     = AKIAYS2NSZLEID5CZMFW
        AWS_SECRET_ACCESS_KEY = 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
        AWS_DEFAULT_REGION    = 'us-east-1'
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

