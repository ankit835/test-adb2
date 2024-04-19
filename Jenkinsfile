
pipeline {
agent { dockerfile true }
    environment{ 
            DATABRICKS_TOKEN_MAIN= credentials('adb-token-main')
      		DATABRICKS_HOST_MAIN= 
            }
    
    stages { 
        stage('deploy') {
           when { branch 'main' }

            steps {  

                    sh '''
                        
                        echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}" | databricks configure --token --profile test
                        
                    '''                

                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
                // // DML deployment
                //     sh '''
                //         DML_FOLDER=/Workspace/Users/
                //         echo $DML_FOLDER
                //         databricks workspace import_dir Demo_DML $DML_FOLDER --exclude-hidden-files --overwrite
                //     '''
            }
        }
    }
}
