#!/bin/bash
# Do not do this.
databricksUrl=https://adb-1851930191878659.19.azuredatabricks.net
/var/lib/jenkins/.local/bin/databricks configure --token << EOF
$databricksUrl
$DATABRICKS_TOKEN_MAIN
EOF

/var/lib/jenkins/.local/bin/databricks workspace list





