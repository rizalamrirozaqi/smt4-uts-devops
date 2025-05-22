pipeline {
  agent any
  
  stages {
    stage('Clone Repo') {
      steps {
        git url: 'https://github.com/rizalamrirozaqi/smt4-uts-devops.git', branch: 'development'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t my-html-app .'
      }
    }

    stage('Login to Vercel') {
      steps {
        withCredentials([string(credentialsId: 'vercel-token', variable: 'VERCEL_TOKEN')]) {
          sh 'npm install -g vercel'
          sh 'vercel login --token $VERCEL_TOKEN || true'
        }
      }
    }

    stage('Deploy to Vercel') {
      steps {
        withCredentials([string(credentialsId: 'vercel-token', variable: 'VERCEL_TOKEN')]) {
          sh 'vercel --prod --token $VERCEL_TOKEN --confirm'
        }
      }
    }
  }
}
