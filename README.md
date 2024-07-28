# HeatWave Lakehouse Auto-ingestion
## Installation
Copy files and folder into OCI Compute /home/opc/autoingest and configure /home/opc/autoingest/init.hw/dev.hw file. </br>
Configure the following in .bash_profile and relogin to compute
```
export PFILE=/home/opc/autoingest/init.hw/dev.hw
```
## Startup and Shutdown
Startup
```
/home/opc/autoingest/start.sh
```
Shutdown
```
/home/opc/autoingest/stop.sh
```
## Monitoring
Simply run the following to monitor the background processes
```
ps -ef | grep c_
```
## How to Create Lakehouse Table
Let say mount_point variable to mount Object Storage Bucket is /home/opc/lakehouse, then autoingest will create 2 subfolder /home/opc/lakehouse/data and /home/opc/lakehouse/arrive </br>
To create database on HeatWave, simply create subfolder under /home/opc/lakehouse/data (i.e. database schema INV)
```
mkdir /home/opc/lakehouse/data/INV
```
To create lakehouse table on HeatWave, simply create subfolder under database subfolder (i.e. /home/opc/lakehouse/data/INV/MTL_MATERIAL_TRANSACTIONS).
```
mkdir /home/opc/lakehouse/data/INV/MTL_MATERIAL_TRANSACTIONS
```
This step will create datababse table (lakehouse) INV.MTL_MATERIAL_TRANSACTIONS upon receiving 1st CSV. </br>
```
Load your CSV into /home/opc/lakehouse/arrive/INV/MTL_MATERIAL_TRANSACTIONS
The CSV must be with "|" field delimiter.
```
The autoingest will create table automatically on HeatWave.
## How to add new data to the Lakehouse Table
Simply load new CSV under subdirectory (folder /home/opc/lakehouse/arrive).
```
cp <second CSV> /home/opc/lakehouse/arrive/INV/MTL_MATERIAL_TRANSACTIONS/
```
## How to modify data in the Lakehouse Table
The Lakehouse table data comes from the CSV. Hence, we need to edit the CSV in one of the following option:
### Option 1

Edit the CSV using vi / vim text editor on Compute Node directly and login to HeatWave MySQL to run the following command to refresh lakehouse table:
```
mysqlsh > mysql_autoingest_admin.refresh_manager_add('<schema_name>','<table_name>');
```
Wait untuk data is changed in the table. After data is changed in the table, then turn off the auto-refresh for the table using the following command in MySQL
```
mysqlsh > mysql_autoingest_admin.refresh_manager_remove('<schema_name>','<table_name>');
```
If the table needs to be refreshed always, then do not run mysql_autoingest_admin.refresh_manager_remove.
### Option 2
Simply download the CSV from the server or edit the CSV using vi / vim text editor on Compute, then change the value inside the CSV. Re-upload the CSV using same name into the respective folder arrive.
For example: /home/opc/lakehouse/arrive/INV/MTL_MATERIAL_TRANSACTIONS </br>
The original CSV in /home/opc/lakehouse/data/INV/MTL_MATERIAL_TRANSACTIONS will get replaced automatically and incremental refresh runs to update data in lakehouse table.
## Footnote
If the CSV file is big, recommend to stop autoingestion before copying and start again the autoingestion after copy end.
