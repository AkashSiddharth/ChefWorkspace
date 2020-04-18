# CIS Policy inetd services cookbook

This cookbook enforces the CIS security standards related to inetd services.

## CIS Benchmark: CIS Ubuntu Linux 18.04 LTS Benchmark
`Version: v2.0.1`
`Release: 01-03-2020`

## Supported Chef version
`>= 14.0`

## Description
This cookbooks checks if the services, xinetd or openbsd-inetd, are installed and
removes them.

### inetd Services
inetd is a super-server daemon that provides internet services and passes connections to configured services. While not commonly used inetd and any unneeded inetd based services should be disabled if possible.
#### Ensure xinetd is not installed (Scored)
*Profile Applicability:*
* Level 1 - Server
* Level 1 - Workstation

*Description:*
The eXtended InterNET Daemon (xinetd) is an open source super daemon that replaced the original inetd daemon. The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.
Rationale:
If there are no xinetd services required, it is recommended that the package be removed.

*Audit:*
Run the following command to verify xinetd is not installed:
`dpkg -s xinetd`

#### Ensure openbsd-inetd is not installed (Scored)
*Profile Applicability:*
* Level 1 - Server
* Level 1 - Workstation

*Description:*
The inetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.

*Rationale:*
If there are no inetd services required, it is recommended that the daemon be removed.

*Audit:*
Run the following command and verify openbsd-inetd is not installed: 
`dpkg -s openbsd-inetd`
