pipeline {
  agent {
    kubernetes {
      label 'mypod'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: maven
    image: maven:alpine
    command:
    - cat
    tty: true
  - name: busybox
    image: busybox
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('maven') {
          sh 'mvn -version'
        }
        container('busybox') {
          sh '/bin/busybox'
        }
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
