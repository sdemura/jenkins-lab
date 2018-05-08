pipeline {
  agent {
    docker {
      image 'python:3.5.1'
    }

  }
  stages {
    stage('build') {
      steps {
        sh 'export FAIL=5'
        sh 'echo For this test, failure is $FAIL'
      }
    }
    stage('test') {
      steps {
        sh './flake.sh'
        sh 'touch a_file'
      }
    }
    stage('cleanup') {
      steps {
        sh 'rm -f a_file'
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