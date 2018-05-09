pipeline {
  agent any
      options {
          timeout(time: 1, unit: 'HOURS')
      }
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'export FAIL=5'
            sh 'echo For this test, failure is $FAIL'
          }
        }
        stage('sleep 30') {
          steps {
            sh '''echo "sleeping for 30"
sleep 30'''
          }
        }
        stage('sleep 10') {
          steps {
            sh '''echo "sleeping for 10"
sleep 10'''
          }
        }
        stage('add a thing') {
          steps {
            sh 'touch another_thing'
          }
        }
        stage('add a artifact') {
          steps {
            sh 'touch my_artifact'
          }
        }
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
            options {
                retry(3)
            }
          steps {
            sh './flake.sh'
            sh 'touch a_file'
          }
        }
        stage('test nothing') {
          steps {
            sh 'echo "testing nothing"'
          }
        }
        stage('') {
          steps {
            sh 'echo "FOO=$FOO"'
          }
        }
        stage('only test not master') {
            when { not { branch 'master' } }
            steps{  
                sh 'echo trolololo'
            }
        }
        }
    }
    stage('Promote') {
        when {
            branch 'master'
        }
        steps {
            echo 'PROMOTING MASTER TO PRODUCTION'
        }
    }
    stage('Cleanup') {
      steps {
        sh 'rm -f a_file'
      }
    }
    stage('') {
      steps {
        archiveArtifacts(allowEmptyArchive: true, artifacts: 'my_artifact')
      }
    }
  }
  environment {
    FOO = 'BAR'
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

