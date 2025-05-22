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
                    branch: 'development',
                    credentialsId: 'vercel-token'
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

      stage('Deploy to Vercel') {
        steps {
            withCredentials([string(credentialsId: 'vercel-token', variable: 'VERCEL_TOKEN')]) {
                sh 'npm install -g vercel'
                sh 'vercel --prod --token $VERCEL_TOKEN --yes'
              }
          }
      }
    }
}
