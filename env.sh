#process BUTool env script
cd BUTool
source env.sh
cd ..
#setup BUTOOL_AUTOLOAD_LIBRARY_LIST
#must be source AFTER build finishes
plugin_paths=$(find $PWD/plugins/*/lib/*evice.so -type f | xargs)
for path in $plugin_paths
do
    export BUTOOL_AUTOLOAD_LIBRARY_LIST=$path:$BUTOOL_AUTOLOAD_LIBRARY_LIST
done
  
