pipeline {
    agent any  // This runs the pipeline on any available Jenkins agent

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
                    // Run the entire build inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        // Install dependencies using Bundler
                        sh 'gem install bundler'
                        sh 'bundle install'

                        // Run RuboCop
                        sh 'bundle exec rubocop'
                    }
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
