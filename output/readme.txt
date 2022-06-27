Name		Visual C++ Redistributables
Publisher	Microsoft
Logo		visual_studio_logo-1280x720.jpg
Install command	powershell.exe -ExecutionPolicy Bypass -command .\Install-VisualCRedist.ps1 -Architecture x86, x64 -showprogress -verbose
Uninstall	powershell.exe -ExecutionPolicy Bypass -command .\Install-VisualCRedist.ps1 -Architecture x86, x64 -showprogress -verbose -uninstall

Install behavior	System
Device restart behavior	No specific action
Operating system architecture	x64
Minimum operating system	Windows 10 1607

Detection Rules		Use a custom detection script - VisualCDetection.ps1
Run script as 32-bit process on 64-bit clients	No
Enforce script signature check and run script silently	No

Dependencies: None
Assignments: Required All devices