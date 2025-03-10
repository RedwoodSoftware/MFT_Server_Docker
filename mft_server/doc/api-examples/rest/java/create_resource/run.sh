cd ../../../../..
javac -cp "./libs/*" ./doc/api-examples/rest/java/create_resource/CreateResourceExample.java
javac -cp "./libs/*" ./doc/api-examples/rest/java/create_resource/CreateS3ResourceExample.java

echo "Select the network storage type:"
select ns in "FTP" "Amazon S3";
do
    echo "Selected option : $ns"
    break
done

if [[ "$ns" = "FTP" ]]; then
java -cp ./libs/*:./doc/api-examples/rest/java/create_resource CreateResourceExample
fi

if [[ "$ns" = "Amazon S3" ]]; then
java -cp ./libs/*:./doc/api-examples/rest/java/create_resource CreateS3ResourceExample
fi

cd ./doc/api-examples/rest/java/create_resource
