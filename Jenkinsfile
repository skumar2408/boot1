pipeline {
   agent any
   tools {
      jdk 'JAVA_HOME'
      maven 'MAVEN_HOME'
    }
    stages{
       stage('Build'){
          steps {
                sh 'mvn clean package'       
                sh "docker build -t webapp:${env.BUILD_ID} ."                
                sh 'docker login -u skumar24 -p kukku@240892'
                sh "echo sameer"
                sh "docker tag webapp:${env.BUILD_ID} skumar24/webapp:${env.BUILD_ID}"                
                sh "docker push skumar24/webapp:${env.BUILD_ID}"
          }
       }
       stage('Run Container on Jenkins Server'){
          steps {
               sh 'docker login -u skumar24 -p kukku@240892'
               sh "docker run -p 8087:8080 -d --name my-apll skumar24/webapp:${env.BUILD_ID}"
          }
    }
 }
}
