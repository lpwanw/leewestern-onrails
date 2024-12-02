node {
    checkout scm
    docker.image('postgres').withRun("-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -p 5432:5432") { container ->
        docker.image("ruby:3.2.2").inside("--link ${container.id}:postgres") {
            withEnv(
                [
                    "DATABASE_URL=postgres://postgres:password@postgres:5432/", 
                    "RAILS_ENV=test",
                    "DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true"
                ]
            ) {
                sh 'bundle install'
                sh 'bin/rails db:create'
                sh 'bin/rails db:migrate'
                sh 'bundle exec rspec'
            }
        }
    }
}
