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
                // Checkout code from the repository
                git credentialsId: 'your-credentials-id', url: 'https://github.com/kanak5522/jk.git', branch: 'feature-branch'
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'

                    // Run Terraform plan and save output
                    def planResult = sh(script: 'terraform plan -out=tfplan', returnStatus: true)

                    // Check if Terraform plan succeeded
                    if (planResult != 0) {
                        error 'Terraform plan failed. Aborting merge.'
                    }
                }
            }
        }

        stage('Merge to Main') {
            when {
                expression { currentBuild.result == null }
            }
            steps {
                script {
                    // Ensure you have necessary permissions and setup for Git operations
                    // Add the necessary remote and merge the branch into main
                    sh 'git config user.email "you@example.com"'
                    sh 'git config user.name "Your Name"'
                    sh 'git remote add origin https://github.com/kanak5522/jk.git'
                    sh 'git checkout main'
                    sh 'git merge feature-branch'

                    // Push the changes to the main branch
                    sh 'git push origin main'
                }
            }
        }
    }

    post {
        always {
            // Clean up or notify steps
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
