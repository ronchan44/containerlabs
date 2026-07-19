# Containerlabs with MikroTik Platform

This repository contains labs built with **[Containerlab](https://containerlab.dev/)** using the **MikroTik RouterOS (CHR)** platform.  
At this stage, the focus is primarily on MikroTik, serving as the foundation for exploring and practicing **routing** and **switching** concepts in a reproducible, containerized environment.  

This is only the beginning — while the current labs highlight MikroTik, future work will expand to additional platforms as long as they are supported by Containerlab. The goal is to build a diverse set of labs that cover multiple vendor ecosystems and networking scenarios.

---

## 🚀 Overview

- **Platform (current)**: MikroTik RouterOS (CHR image)
- **Lab Manager**: Containerlab
- **Focus Areas**:
  - Routing protocols (static, OSPF, BGP)
  - Switching behavior (bridges, MLAGs, VLANs, trunk/access ports)
  - Policy routing and mangle rules
  - Broader topics to be added over time as new platforms are integrated

---

## 📦 Requirements

To run these labs successfully, ensure you have:

- **[Docker](ca://s?q=Install_Docker_for_Containerlab)** installed and running on your system  
- **[Visual Studio Code](ca://s?q=Install_VSCode)** with the **[Containerlab extension](ca://s?q=VSCode_Containerlab_extension)** for easier lab management and visualization  
- Basic familiarity with **[Containerlab CLI](ca://s?q=Containerlab_CLI_usage)** commands

---

## 📝 Notes

- Default credentials for MikroTik CHR nodes: `admin/admin`  
- Use `prefix: ""` to keep node names clean (no `clab-` prefix)  
- Avoid `clab redeploy --cleanup` unless you want to reset configurations
