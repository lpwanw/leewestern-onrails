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
                git branch: 'main', url: 'https://github.com/your-user/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // You can use an existing Docker image with Ruby or build your own.
                    // Here, we assume the Docker image includes Ruby 3.2.2, Bundler, and RuboCop.

                    // Pulling a Ruby 3.2.2 image with Rails setup
                    dockerImage = docker.image('ruby:3.2.2')

                    // Run the command inside the Ruby Docker container
                    dockerImage.pull()  // Make sure the image is up to date
                }
            }
        }

        stage('Install Dependencies & Run RuboCop') {
            steps {
                script {
                    // Run inside the Ruby Docker container
                    dockerImage.inside("--env GEM_HOME=${GEM_HOME} --workdir /workspace") {
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
