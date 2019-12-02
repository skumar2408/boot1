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
       stage('DeployToProduction'){
            		steps {
                		kubernetesDeploy(
                    			kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
                    			configs: 'auth-deploy.yml'
                		)
       }
 }
}
}
