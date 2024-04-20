pipeline {
agent any
    environment{ 
            DATABRICKS_TOKEN_MAIN=credentials('token-adb')
      		DATABRICKS_HOST_MAIN='https://adb-1851930191878659.19.azuredatabricks.net'
            ADB_HOME="/var/lib/jenkins/.local/bin"
            }
    
    stages { 
        stage('deploy') {
           when { branch 'main' }

            steps {  
//            echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}" | databricks configure --token --profile main
                    sh '''
                        
                         echo "$DATABRICKS_HOST_MAIN\n$DATABRICKS_TOKEN_MAIN" | ${ADB_HOME}/databricks configure --token --profile DEV
                        
                     '''                

                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         ${ADB_HOME}/databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
            }
        }
    }
}
