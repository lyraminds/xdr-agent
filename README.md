Arguments
```
-G Group to which your enroll
-M Manager xdr Server URL
-A Agent name ie enrolling system name, Optional will pick your system hostname
```

## Mac, DEB, RPM installer

Install Default
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash
```
Install with custom name
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- install -A enrolling-system-name
```
Install with group
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- install -G MYORG
```
Install with management server 
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- install -M xdr.yourdomain.com
```
Install with All options 
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- install -G MYORG -M xdr.yourdomain.com -A enrolling-system-name
```
Re-enroll to a different group and manager
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- enroll -G MYORG -M xdr.yourdomain.com
```
Remove
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- remove
```
Status
```
curl -fsSL "https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.sh" | sudo bash -s -- status
```


## Windows

Download the installer once
```
Invoke-WebRequest https://raw.githubusercontent.com/lyraminds/xdr-agent/refs/heads/main/install.ps1 -OutFile install.ps1
```
Fresh install, hostname as name	
```
.\install.ps1
```
Fresh install, custom name + group	
```
.\install.ps1 install -A web-server-1 -G client-a
```
Fresh install, different manager	
```
.\install.ps1 install -A web-server-1 -G client-a -M other-mgr.example.com
```
Agent already installed, re-enroll into new group	
```
.\install.ps1 enroll -G client-b
```
Uninstall	
```
.\install.ps1 remove
```
Check connection state	
```
.\install.ps1 status
```
