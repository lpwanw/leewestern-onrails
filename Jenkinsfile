node {
    checkout scm

    def mainImage = docker.image("ruby:3.2.2")

    stages {
        stage("Build") {
            steps {
                script {
                    mainImage.inside {
                        sh 'bundle install'
                    }
                }
            }
        }

        stage("Rubocop") {
            steps {
                script {
                    mainImage.inside {
                        sh 'bundle exec rubocop'
                    }
                }
            }
        }

        stage("RSpec") {
            steps {
                script {
                    docker.image('postgres').withRun("-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -p 5432:5432") { container ->
                        mainImage.inside("--link ${container.id}:postgres") {
                           withEnv(
                                [
                                    "DATABASE_URL=postgres://postgres:password@postgres:5432/", 
                                    "RAILS_ENV=test",
                                    "DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true"
                                ]
                            ) {
                                sh 'bin/rails db:create'
                                sh 'bin/rails db:migrate'
                                sh 'bundle exec rspec'
                            }
                        }  
                    }
                }
            }
        }
    }
}
