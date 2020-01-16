# Auto Winlogbeat for Windows.

This is a application that automates the downloading, installation, and running of Winlogbeat into Vizion.ai


## What is Winlogbeat?

Winlogbeat is a live streaming lightweight shipper for windows event logs. It helps to keep a pulse on what's happening across Windows-based infrastructures. There's a lot to learn from your Windows event logs. Interested in security events like logon successes (4624) and failures (4625)? How about when a storage device is attached (4663) or a new service is installed (4798)? Winlogbeat can be configured to read from any event log channel, giving you access to the Windows data you need most.


## Running the application

Double-click:

```
winlogbeatDL.exe
``` 

This will run the application. When prompted, enter the appropriate information that was generated when you created a stack (i.e. username, password, etc...), and click continue.

After a successful running and installation, the application will redirect you to the Kibana portal. In Kibana, go to the discover tab and you will see Winlogbeat logs shipping in. 

(Make sure 'auditbeat-*' is the defined index in the top left of the screen. You make also need to change the 'auto-refresh' to 5 seconds)


## Dashboard

To display the built-in Winlogbeat dashboard, in Kibana, click on the dashboard tab and the search 'winlogbeat'.

Click on the link:

```
Winlogbeat Dashboard
```

This will load the dashboard which can also be customized. 


## Uninstalling the application

Double-click:

```
winlogbeatUninstall.exe
```

This will stop Winlogbeat, uninstall it, and send it to the Recycle bin.


