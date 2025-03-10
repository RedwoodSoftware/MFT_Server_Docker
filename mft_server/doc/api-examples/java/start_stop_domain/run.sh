cd ../../../..
javac -cp "./libs/*" ./doc/api-examples/java/start_stop_domain/StartDomainExample.java ./doc/api-examples/java/start_stop_domain/StopDomainExample.java
java -cp ./libs/*:./doc/api-examples/java/start_stop_domain StartDomainExample
java -cp ./libs/*:./doc/api-examples/java/start_stop_domain StopDomainExample
cd ./doc/api-examples/java/start_stop_domain
