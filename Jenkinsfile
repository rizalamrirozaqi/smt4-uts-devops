pipeline {
  agent {
    docker {
      image 'node:18-alpine'
    }
  }
    stages {
        stage('Checkout') {
            steps {
                git(
                    url: 'https://github.com/rizalamrirozaqi/smt4-uts-devops.git',
                    branch: 'main',
                    credentialsId: 'github-token-rizal' // ganti dengan ID credentials kamu yang benar
                )
            }
        }

        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
}
