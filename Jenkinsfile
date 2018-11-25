pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '13.126.151.24', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '13.126.151.24', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "cp  **/target/*.war /opt/tomcat/latest/webapps/"
                    }
                }

               
            }
        }
    }
}