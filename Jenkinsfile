pipeline {
    agent any  // Use any available agent (node)

    environment {
        // Set the Ruby version if using RVM or rbenv
        RUBY_VERSION = '3.2.2'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: 'main', url: 'https://github.com/lpwanw/leewestern-onrails.git'
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
}
