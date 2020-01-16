# Auto Auditbeat for Windows.

This is a application that automates the downloading, installation, and running of Auditbeat into Vizion.ai


## What is Auditbeat?

Auditbeat is a lightweight shipper that you can install on your servers to audit the activities of users and processes on your systems. You can also use Auditbeat to detect changes to critical files, like binaries and configuration files, and identify potential security policy violations.


## Running the application

Double-click:

```
auditbeatDL.exe
``` 

This will run the application. When prompted, enter the appropriate information that was generated when you created a stack (i.e. username, password, etc...), and click continue.

After a successful running and installation, the application will redirect you to the Kibana portal. In Kibana, go to the discover tab and you will see Auditbeat logs shipping in. 

(Make sure 'auditbeat-*' is the defined index in the top left of the screen. You make also need to change the 'auto-refresh' to 5 seconds)


## Dashboard

To display the built-in Auditbeat dashboard, in Kibana, click on the dashboard tab and the search 'auditbeat'.

Click on the link:

```
[Auditbeat File Integrity] Overview
```

This will load the dashboard which can also be customized. 


## Uninstalling the application

Double-click:

```
auditbeatUninstall.exe
```

This will stop Auditbeat, uninstall it, and send it to the Recycle bin.


## Caveats

Auditbeat is setup to monitor the following default folders default folders:

```
- C:/windows
- C:/windows/system32
- C:/Program Files
- C:/Program Files (x86)
```

