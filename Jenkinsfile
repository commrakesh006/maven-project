pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '35.154.12.156', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '35.154.12.156', description: 'Production Server')
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
                        sh "sudo cp  **/target/*.war /opt/tomcat/latest/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                         sh "sudo cp  **/target/*.war /opt/tomcat/latest/webapps"
                    }
                }
            }
        }
    }
}