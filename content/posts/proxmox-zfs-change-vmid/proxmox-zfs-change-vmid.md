+++
title = "How to change Proxmox VMIDs (ZFS)"
slug = "proxmox-zfs-change-vmid" # Set manually if title is not usable as slug
date = "2024-11-10T23:44:53-07:00"
#dateFormat = "2006-01-02 3:04:06 PM MST"
author = "" # Set author name here!
#tags = ["", ""]
#keywords = ["", ""]
description = "This guide will walk you through changing a Proxmox VE VMID for systems running ZFS. Other systems may require different steps."
showFullContent = false
readingTime = true
hideComments = false
draft = false
+++
# Overview
This guide will walk you through changing a Proxmox VE VMID for systems running ZFS. Other systems may require different steps.

Replace (old-vmid) with the current VMID and (new-vmid) with the desired VMID. Replace (node) with the name of the Proxmox node.

If you are not in a cluster, the config file may also be at `/etc/pve/qemu-server/`.
# Shut down VM
```
qm shutdown (old-vmid)
```

# Optional: Rename disks
## Rename disks in config file
```
vim /etc/pve/nodes/(node)/qemu-server/(old-vmid).conf
```
## List ZFS volumes
```
zfs list -t all
```
## Rename ZFS volumes (rename all affected)
```
zfs rename rpool/data/vm-(old-vmid)-disk-0 rpool/data/vm-(new-vmid)-disk-0
```

# Rename config file
```
mv /etc/pve/nodes/(node)/qemu-server/(old-vmid).conf /etc/pve/nodes/(node)/qemu-server/(new-vmid).conf
```

# Start VM
**Host restart is *not* required**
```
qm start (new-vmid)
```