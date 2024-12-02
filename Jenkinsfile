pipeline {
    agent {
        docker { image 'ruby:3.2.2-slim-bullseye' }
    }

    environment {
        RUBY_VERSION = '3.2.2' // Set the Ruby version you are using
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository from GitHub
                git branch: 'main', url: 'https://github.com/lpwanw/leewestern-onrails.git'
            }
        }

         stage('Install Dependencies') {
            steps {
                script {
                    // Ensure Ruby and Bundler are available
                    sh 'docker --version'
                }
            }
        }

        stage('Run RuboCop') {
            steps {
                script {
                    // Run RuboCop directly
                    sh 'bundle exec rubocop'
                }
            }
        }
    }
}
