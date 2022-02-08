pipeline {
  agent {
    kubernetes {
            inheritFrom '3a166650-f8f8-11eb-8613-0242ac140003' 
            yaml ```
                spec:
                    containers:
                    - name: jnlp
                      image: jenkins/inbound-agent:4.11-1
                      resources:
                        limits:
                            memory: "1Gi"
                            cpu: "0.25"
                        requests: {}
                      workingDir: "/home/jenkins/agent"
            ```
        }
  }
  stages {
    stage('hello') {
      steps {
        echo 'hello'
      }
    }

  }
}
