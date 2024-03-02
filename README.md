# Data Enginerring Zoom Camp 2024 🚀
Welcome to my Data Engineering journey! This repository documents my daily progress as I delve into the world of Data Engineering through the Zoomcamp 2024 course. The journey began on January 15th, 2024, and I am determined to dedicate 2 hours daily to ensure a comprehensive understanding of the course content

## Overview
![Alt text](https://github.com/SammyGIS/sammygis-data-engineering_zoomcamp/blob/main/overview.jpeg)

### Background 📖
Initiating the course in 2023, challenges accessing Google Cloud Computing services hindered my progress. However, 2024 presents a new opportunity, and I am determined to overcome obstacles and complete the program. This repository serves as a daily log of my learning, encompassing tools, concepts, and hands-on exercises.

## Daily Log 📆

### Day 1: 16th January 2024

- **Progress:**
  - Started the course afresh, building on previous knowledge.
  - Explored various terms and tools related to Data Engineering.

### Day 2: 17th January 2024
- **Progress:**
- mapping a volume to the postgress image to an outside folder, so that everyting we run our postgress that data will be stoer eon the local computer
  - Started a postgres docker container, use pgcli to access my database in the command line.
  - ingest data to the database using python, while connecting to the database that was running in docker.

### Day 3: 18th January 2024
- **Progress:**
  - Networking in docker, well we did netoweking via the command line, by noccting the two docker image (pgadmin4 and postres 14) to the same network
  - ingest data to the database using dockerfile.
  - creating docker compose file and running it, the docker compose file is created uisng postgrs and pgadmin image, instead of using command line to run saveral line by flagging our ingested script , we decided to use docker compose to create and connect the tow together, so that when we use Dockerfile to ingest our data to postgres, we will be able to use docker compose to aceess the data.

### Day 4: 19th January 2024
- **Progress:**
- Run through the sql refresher course, by running some sql queriers inpgadmin to query some data
- Setting up google cloud video will be watched but i wont set it up untill,  strated using it
- Learn about Terraform

### Day 4: 19th January 2024
- **Progress:**
- Run through the sql refresher course, by running some sql queriers inpgadmin to query some data
- Setting up google cloud video will be watched but i wont set it up untill,  strated using it
- Learn about Terraform

### Day 4: 20th January 2024
- **Progress:**
- watched the terraform video, learn ablot on terrafrom, create a gcs bucket and destroy it

### Day 5: 21th January 2024
- **Progress:**
- was pretty occupied so i took a rest to reminisce on my journey so far and read some articles online - - read what people have done so far 

### Day 6: 22th January 2024
- **Progress:**
- learning about terrafrom variable, and working with
- learn introduction to mage, clone magezoomcamp repo online
- learn how to configure mage using docker
- followed up the crating simple pipeline mage video and followed everything step by step

### Day 7: 23th January 2024
- **Progress:**
- setup mage using docker compose, understand mage ui and also understand
- continue with mage connect merge to postgres, creating a postgress data load with sql (creating new pipeline)
- Building ETL API poipleine and storing it on postgress using mage 

### Day 8: 24th January 2024
- **Progress:**
- setup mage using docker compose, understand mage ui and also understand
- continue with mage connect merge to postgres, creating a postgress data load with sql (creating new pipeline)
- Building ETL API poipleine and storing it on postgress using mage 

### Day 9: 25th January 2024
- **Progress:**
- setup mage using docker compose, understand mage ui and also understand
- continue with mage connect merge to postgres, creating a postgress data load with sql (creating new pipeline)
- Building ETL API poipleine and storing it on postgress using mage 


### Day 10: 26th January 2024
- **Progress:**
- Do week 1 assignment for both terrarom and sql then submit it

******************************* I had to take this break to find a way to set up my own GCP before continuing with the course***************************************

### Day 11: 1st Febrauary, 2024
- **Progress:**
- Finally set up GCP account.
- since have access to GCP now, I then praticed what i learnt on terraform, create bucket and big query dataset then destroy it


### Day 12: 6th Febrauary, 2024
- **Progress:**
- Setting up image and loading data to the google cloud
- created service account for mage where i gave access to cloud storage and bigquery
- created new bucket, load the parque format of my file to gcs

### Day 13: 7th Febrauary, 2024
- **Progress:**
- Upload parttioned parquet file to gcs wokered, wrote code to upload the data to bigquery but my code was not running

### Day 14: 9th Febrauary, 2024
- **Progress:**
- solve the runining non-stop issue by clearing the output and restarting the kenel in the edit tool, had to read a lot of issue before i could stop this

### Day 15: 10th Febrauary, 2024
- **Progress:**
- solve the home week for week 2, which i had written the ocde but coudnlt run because of the run time issue.
- work on starting a terraform template for starting mage in GCP
- the following servies was added to the service account,bigquery admin, storage admin, artifact read and writer, cloud developer run, all this are added to the service account that will be used to run the tamplate after the json key has been downloaded
-  start week 3, run into big query, learnt  about external tables, partitioning, and cluster in bigquery
- learnt about the big query interanl on how it works the staging within the big query.
- Learn about machine learning in big query

### Day 16: 11th Febrauary, 2024
- **Progress:**
- solve asisgnment oroblem, running the green data in mage
- write etl process to get the 2022 green datix data from nyc_taxi website to gcs using merge
- familiarise myself with bigquery, by creating external table using the data to gcs

### Day 17: 12th Febrauary, 2024
- **Progress:**
- Solve problem using partitioning and cluster in big query to improve the eififceince and reduce the cost of running query
- Hands on machine learning problem in bigquery using the ML model inbuilt
- Get intorduced to week four topics on introduction to dbt 


### Day ....: Day 15th to 28th Febrauary, 2024
- **Progress:**
- Learnt dbt cloud and create resipotory in github and connect it to dbt cloud, connect it to bigquery 
- Learn about dbt model, dbt snapshot, dbt seed, dbt macro, learn about packages and variables 
- dbt seed : this is where data like csv is saved, data that does not change easily
- Setting up dbt yaml project
- Learn about different type of materialised table: table, view, incremental tables 
- Create staging data for yellow and green taxi data
- Create dbt test to test the data, there are two type of test generic and 
- dbt testing and documenation, all set in the yellow shcema.yml file

## Day 19
**Progress**
- Create VM istance using ssh key  get information from: https://cloud.google.com/compute/docs/connect/create-ssh-keys
- Go to your linux or bash home on your pc home and create an ssh  directory or use cd  the command ``` mkdir .ssh/`` 
- perfome what was gotten from the link in the first step
- then go to metadata under setting in gcp compute engine and add the sshskey, copy the public activate ssh key created from follwowing the last step
- Create a Virtual MAchine Instance
- then go to local bash change to the pc home using ```cd ~```, then connect to the system by uisng the folowing command
-  ```ssh -i ~/.ssh/gcpb sammygis@35.194.88.53``` (external ip address of the VM)
- Install Anaconda on the WM
  Download anaconda for linux and use bash to install it
- Create an easy activation config file that you can ssh into the isntances easily
- Update linux - sudo apt-get update
- Install docker - sudo apt install docker.io
    sudo groupadd docker
    sudo gpasswd -a$USER docker
    sudo service docker restart

    control D - this is used to logout of a VM to resphras or fo source .bashrc
 - Configure VS code to have access to the remote machine using >remote-ssh ( this will only work when you enable and isntall the   remote-ssh extension)
- conect to new host, and sellect the current host running on the pc

- Install Spark on The VM
  create spark folder
  download https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz

  install java
  export JAVA_HOME="${HOME}/spark/jdk-11.0.1"
  export PATH="${JAVA_HOME}/bin:${PATH}"

  install spark

  export SPARK_HOME="${HOME}/spark/spark-3.0.3-bin-hadoop3.2"
  export PATH="${SPARK_HOME}/bin:${PATH}"

  Install pysaprk
  export PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"
  export PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.9-src.zip:$PYTHONPATH"

  spark-shell to check if spark is wroing after installation

  put all those export variable in your .bashrc file so that it automate this process once we start the vm

- IF you satrt a new Vm and delete the old one 
  run ssh-keygen -R35.245.25.41 external IP of the new instances so that it can replace the last one

- Run spark jupyter notebook on the terminal
- forwarding the port in of the jupiter noteboook using vs code so that you can have access to the notebook locally

## Day 19
**Progress**
- Loading data using pyspark-sql, building schema using spark-sqldatatypes
- loading pandas dataframe into saprk dataframe
- using Spark session to set core to be used by process
- Patitioning and clusters of pyspark
- Understanding pysaprk master UI
- Spark DataFrame, loading the partitioned parquet file usng spark dataframe
- lazy processing (transformation and actions in spark)

This journey promises to be exciting as I navigate through different tools and concepts in Data Engineering. Cheers to continuous learning and growth! 🌱