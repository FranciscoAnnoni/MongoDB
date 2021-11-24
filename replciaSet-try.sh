#!/bin/bash

#0 crear la carpeta mongo.pid
    
    mkdir /var/run/mongodb

 
#1 -- recordar de borrar el archivo mongod.bim (mirar logs)

    mongod --config /etc/conf/db4/mongod.conf --replSet myReplicaSet &
    
    mongod --config /etc/conf/db5/mongod.conf --replSet myReplicaSet &
 
    mongod --config /etc/conf/db6/mongod.conf --replSet myReplicaSet &

 #2 -- esperamos un poco a que se creen los 3 servidores 

    sleep 5  

 #  creamos las conecciones pertinentes
	
    # creamos una config para agregar directamente las instancias del replcia set
 
    cfg="{
        _id: 'set',
	members: [
        {_id: 1, host: 'localhost:2717'},
        {_id: 2, host: 'localhost:2727'},
        {_id: 2, host: 'localhost:2737'}
       ] 
    
    }"	
    
    mongo --port 2717 --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))"

    mongo --port 2727
    mongo --port 2737
   
    # activamos el primary node
    cat

     
#1 -- recordar de borrar el archivo mongod.bim (mirar logs)

    mongod --config /etc/conf/db4/mongod.conf --replSet myReplicaSet
    
    mongod --config /etc/conf/db5/mongod.conf --replSet myReplicaSet
 
    mongod --config /etc/conf/db6/mongod.conf --replSet myReplicaSet

    #   /var/run/mongodb/mongod.pid
	
    mongo --port 2717
    mongo --port 2727
    mongo --port 2737
   
    # activamos el primary node
    
    rs.status()
    
    rs.initiate()
    
    cls

    rs.status() #para saber que se haya agregado bien 

    rs.add("localhost:2727")
    
    rs.add("localhost:2737")

    db.users.insert({"name": "fran test"})

    rs.secondaryOk() #para poder leer desde las demas replica set

    db.users.find()  #para ver el user creado desde el replica set principal

    

