
pipeline {
agent { dockerfile true }
    environment{ 
            DATABRICKS_TOKEN_MAIN=credentials('token-adb')
      		DATABRICKS_HOST_MAIN='https://adb-1851930191878659.19.azuredatabricks.net'
            }
    
    stages { 
        stage('deploy') {
           when { branch 'main' }

            steps {  
//            echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}" | databricks configure --token --profile main
                    sh '''
                        
                        'echo ${env.DATABRICKS_HOST_MAIN}\n${env.DATABRICKS_TOKEN_MAIN} | databricks configure --token'
                        
                    '''                

                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
            }
        }
    }
}
