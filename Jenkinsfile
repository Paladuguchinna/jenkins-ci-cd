pipeline {

    agent any

    stages {
        stage('Test') {
            steps {
                sh 'docker run --rm -ti -v /root/.m2:/root/.m2 -v $PWD/build/simple-java-maven-app:/app -w /app mv test'
            }
            post {
                always {
                    junit 'build/simple-java-maven-app/target/surefire-reports/*.xml'
                }
            }
        }
/*      stage('Test') {
            steps {
                sh 'cd simple-java-maven-app/ && mvn test'
            }
            post {
                always {
                    junit 'simple-java-maven-app/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh ''
            }
        }
        */
    }
}