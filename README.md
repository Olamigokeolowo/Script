
This script is built to analyze key server performance metrics, offering real-time insights into CPU usage, memory consumption, disk space, and top resource-heavy processes. By executing the script, system administrators can quickly assess server health and take necessary actions to optimize performance. It is lightweight and efficient, making it ideal for both manual monitoring and automation through cron jobs, which allow it to run at scheduled intervals without manual intervention.  

To use the script, clone the repository, navigate to its directory, grant execution permissions, and run it. If continuous monitoring is required, setting up a cron job ensures that the script runs automatically at specified intervals, helping maintain server stability and efficiency.

# Server Status Check Script  

## Overview  
This Bash script checks the status of a server by retrieving system information such as uptime, CPU usage, memory usage, and the status of critical services.  

## Features  
- Displays system uptime  
- Checks CPU and memory usage  
- Lists active processes  
- Monitors disk usage  
- Verifies service availability  

## Prerequisites  
Ensure the following dependencies are installed on the server:  
- bash (default on most Linux distributions)  
- uptime (included in coreutils)  
- top or htop (for CPU/memory usage)  
- df (for disk space monitoring)  
- systemctl or service (for checking service status)  

##  Installation  
Clone the repository and navigate to the script directory:  
```  bash
git clone https://github.com/Olamigokeolowo/Script.git
cd Script
chmod +x server_stats.sh
./server_stats.sh
```

Below is the result of the code:


![Image](https://github.com/user-attachments/assets/6bad2771-0e00-4bc6-bc9d-0e85da532c7e)
