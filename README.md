# AutoBeats

This is a application that automates the downloading, installation, and running of various Beats into Vizion.ai Elasticsearch.

Current supported beats:

  * Filebeat
  * Metricbeat
  * Winlogbeat
  * Auditbeat
  * Heartbeat
  * Apachebeat (currently runs as a filebeat)


## Prerequisites:

You will need a Vizion.ai account and credentials to run the applications. The account is free. If you don't already have an account, please go to:

https://app.vizion.ai/

-or-

https://pnap.vizion.ai/


Follow the steps for setting up the 'Elasticsearch Service' and then generate a stack. This will then provide you with the credentials that you will need save and use when running the applications.

Powershell v.5 or greater


## Downloading

Application repository can be found https://github.com/themarcusaurelius/autoBeats


Two ways to download:

1. Download through git:

```
git clone https://github.com/themarcusaurelius/autoBeats.git
```

2. Download as ZIP and then unpackage.



## Running an application

Open the folder to the Beat you would like to install and double click on the '.exe' file that will launch the application. When prompted, enter the credentials from you Vizion.ai account. 
