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
l


This journey promises to be exciting as I navigate through different tools and concepts in Data Engineering. Cheers to continuous learning and growth! 🌱



(Note: The image provided via the URL is not displayed here due to technical limitations. Please check the URL directly for the image.)