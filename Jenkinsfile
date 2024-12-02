pipeline {
    agent any  // This runs the pipeline on any available Jenkins agent

    environment {
        GEM_HOME = '/usr/local/bundle'
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
                    sh 'rvm use 3.2.2'
                    sh 'ruby -v'  // Check Ruby version
                    sh 'gem install bundler'  // Install Bundler if it's not installed
                    sh 'bundle install'  // Install the required gems
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

    post {
        always {
            // Clean up any temporary files or artifacts, if needed
            cleanWs()
        }
    }
}
