pipeline {
  agent none
  stages {
    stage('first') {
      agent any
      steps {
        sh 'echo test'
      }
    }

    stage('') {
      agent any
      steps {
        sleep 1
        sh 'echo second'
      }
    }

  }
}