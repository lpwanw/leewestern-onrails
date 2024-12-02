pipeline {
    agent any  // Use any available agent (node)

    environment {
        // Set the Ruby version if using RVM or rbenv
        RUBY_VERSION = '3.0.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: 'main', url: 'https://github.com/your-user/your-repo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // If you're using Bundler to manage Ruby gems
                    sh 'gem install bundler'  // Install Bundler if not already installed
                    sh 'bundle install'       // Install dependencies listed in Gemfile
                }
            }
        }

        stage('Run RuboCop') {
            steps {
                script {
                    // Run RuboCop to check Ruby code style
                    sh 'bundle exec rubocop'
                }
            }
        }
    }

    post {
        always {
            // This will always run, useful for cleanup if needed
        }
        success {
            // Optional: Notifications or success messages
        }
        failure {
            // Optional: Handle failure, such as sending notifications
        }
    }
}
