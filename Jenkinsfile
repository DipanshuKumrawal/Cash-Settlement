pipeline {
    agent {label "deep"}

    stages {
        stage('Clone Repository') {
            steps {
                git url:"https://github.com/DipanshuKumrawal/Cash-Settlement.git", branch:"master"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t cash-settlement:latest ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'This is pushing the image to docker hub'
                withCredentials([usernamePassword(credentialsId: 'DockerHubCred', usernameVariable: 'DockerHubUser', passwordVariable: 'DockerHubPass')]){
                    sh "docker login -u ${env.DockerHubUser} -p ${env.DockerHubPass}"
                    sh "docker image tag cash-settlement:latest ${env.DockerHubUser}/cash-settlement:latest"
                    sh "docker push ${env.DockerHubUser}/cash-settlement:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'This is deploying the code'
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
