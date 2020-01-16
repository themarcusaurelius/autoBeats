# Auto Metricbeat for Windows.

This is a application that automates the downloading, installation, and running of Metricbeat into Vizion.ai


## What is Metricbeat?

A lightweight shipper for system Metrics.

Collect metrics from your systems and services. From CPU to memory, Redis to NGINX, and much much more, Metricbeat is a lightweight way to send system and service statistics.

## Running the application

Double-click:

```
metricbeatDL.exe
``` 

This will run the application. When prompted, enter the appropriate information that was generated when you created a stack (i.e. username, password, etc...), and click continue.

After a successful running and installation, the application will redirect you to the Kibana portal. In Kibana, go to the discover tab and you will see Metricbeat logs shipping in. 

(Make sure 'metricbeat-*' is the defined index in the top left of the screen. You make also need to change the 'auto-refresh' to 5 seconds)


## Dashboard

To display the built-in Metricbeat dashboards, in Kibana, click on the dashboard tab and the search 'Metricbeat System'.

Click on the link:

```
[Metricbeat System] Overview
```

or 

```
[Metricbeat System] Host overview
```


This will load the respective dashboard which can also be customized. From there, 


## Uninstalling the application

Double-click:

```
metricbeatUninstall.exe
```

This will stop Metricbeat, uninstall it, and send it to the Recycle bin.