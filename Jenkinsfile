pipeline {
agent any
    environment{ 
            DATABRICKS_TOKEN_MAIN=credentials('token-adb')
           ADB_HOME="/var/lib/jenkins/.local/bin"  
            }
    
    stages { 
        stage('deploy') {
           when { branch 'main' }
            
            steps {  
//            echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}" | databricks configure --token --profile main
                    // sh '''
                        
                    //      echo "$DATABRICKS_HOST_MAIN\n$DATABRICKS_TOKEN_MAIN" | databricks configure --token --profile DEV
                        
                    //  '''  
                         sh "chmod +x -R ${env.WORKSPACE}"   
                         sh "configure_script/sc.sh"     
                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         $ADB_HOME/databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
            }
        }
    }
}
