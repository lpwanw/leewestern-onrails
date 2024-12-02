pipeline {
    agent any  // Run on any available Jenkins agent
    
    environment {
        // Set Ruby version (ensure it's installed in the Docker image)
        RUBY_VERSION = '3.2.2'
        // The location where gems will be installed inside the Docker container
        GEM_HOME = '/usr/local/bundle'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/lpwanw/leewestern-onrails.git'
            }
        }

         stage('Run RuboCop in Docker') {
            steps {
                script {
                    // Use Docker container with Ruby 3.2.2
                    docker.image('ruby:3.2.2').inside("-e GEM_HOME=${GEM_HOME} -v") {
                        // Install the required gems from Gemfile
                        sh 'gem install bundler'
                        sh 'bundle install'

                        // Run RuboCop to check the Ruby code style
                        sh 'bundle exec rubocop'
                    }
                }
            }
        }

    }
}
