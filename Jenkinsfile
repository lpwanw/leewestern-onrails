node {
    environment {
        BUNDLE_PATH = "/app/vendor/bundle"
        DATABASE_URL = "postgres://postgres:password@postgres:5432/"
        RAILS_ENV = "test"
        BUNDLE_CACHE = "true"
        DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL = "true"
    }

    checkout scm

    def mainImage = docker.image("ruby:3.2.2")
    def volumeName = "my_persistent_volume"

    stage("Build") {
        script {
            mainImage.inside("-v ${volumeName}:/app") {
                sh 'chown -R $(id -u):$(id -g) /app/vendor/bundle'
                sh 'bundle config set path \'/app/vendor/bundle\''
                sh 'bundle install'
            }
        }
    }

    stage("Rubocop") {
        script {
            mainImage.inside("-v ${volumeName}:/app") {
                sh 'bundle exec rubocop'
            }
        }
    }

    stage("RSpec") {
        script {
            docker.image('postgres').withRun("-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -p 5432:5432") { container ->
                mainImage.inside("-v ${volumeName}:/app --link ${container.id}:postgres") {
                    sh 'bin/rails db:create'
                    sh 'bin/rails db:migrate'
                    sh 'bundle exec rspec'
                }
            }
        }
    }
}
