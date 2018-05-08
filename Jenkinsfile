pipeline {
    agent { docker { image 'python:3.5.1' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
    }
    post {
        always {
            echo 'Hello there!'
        }
        success {
            echo 'We have a winner!'
        }
        failure {
            echo 'Something went bad'
        }
        unstable {
            echo 'Looks like we have a flaker'
        }
        changed {
            echo 'Something changed, so you are reading this'
        }
    }
}
