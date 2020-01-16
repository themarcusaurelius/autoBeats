# Auto Filebeat for Windows.

This is a application that automates the downloading, installation, and running of Filebeat into Vizion.ai


## What is Filebeat?

Filebeat is a lightweight shipper for log and various other types of data. It can also handle .csv files. It runs on the machine(s) you wish to monitor and automatically crawls files and sends the data to the Vizion Elastic App.


## Running the application

Double-click:

```
filebeatDL.exe
``` 

This will run the application. When prompted, enter the appropriate information that was generated when you created a stack (i.e. username, password, etc...), and click continue. you will then be prompted to choose the file path to the folder where the data you would liek to monitor is stored.

After a successful running and installation, the application will redirect you to the Kibana portal. In Kibana, go to the discover tab and you will see Filebeat logs shipping in. 

(Make sure 'filebeat-*' is the defined index in the top left of the screen. You make also need to change the 'auto-refresh' to 5 seconds)


## Uninstalling the application

Double-click:

```
filebeatUninstall.exe
```

This will stop Filebeat, uninstall it, and send it to the Recycle bin.


## Caveats

This only runs Filebeat itself and doesn't pre-process the data into respective fields. To do this, you will need to create a custom pipeline add it to the 'filebeat.yml'