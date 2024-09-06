pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('Acesskeyidknk')
        AWS_SECRET_ACCESS_KEY = credentials('secretkeyknk')
        GITHUB_TOKEN          = credentials('newwwwww')
        AWS_DEFAULT_REGION    = 'eu-west-1'
    }

    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically approve the Terraform apply')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kanak5522/nomergecheck.git', credentialsId: 'newwwwww'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Apply') {
            when {
                expression { params.action == 'apply' }
            }
            steps {
                script {
                    if (params.autoApprove) {
                        sh 'terraform apply -auto-approve tfplan'
                    } else {
                        sh 'terraform apply tfplan'
                    }
                }
            }
        }
        stage('Destroy') {
            when {
                expression { params.action == 'destroy' }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the pipeline finishes
            cleanWs()
        }
    }
}
