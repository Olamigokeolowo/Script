server-stats.sh

#!/bin/bash

# Function to get total CPU usage
get_cpu_usage() {
    echo "📊 CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print "  Used: " 100-$8"%"}'
}

# Function to get memory usage
get_memory_usage() {
    echo "🛠 Memory Usage:"
    free -m | awk 'NR==2{printf "  Used: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2}'
}

# Function to get disk usage
get_disk_usage() {
    echo "💾 Disk Usage:"
    df -h --total | awk '$1 == "total" {printf "  Used: %s / %s (%s)\n", $3, $2, $5}'
}

# Function to get top 5 CPU consuming processes
get_top_cpu_processes() {
    echo "🔥 Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

# Function to get top 5 memory consuming processes
get_top_memory_processes() {
    echo "📌 Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

# Optional stats
get_optional_stats() {
    echo "🖥 OS Version: $(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
    echo "⏳ Uptime: $(uptime -p)"
    echo "⚖ Load Average: $(uptime | awk -F'load average:' '{print $2}' | xargs)"
    echo "👥 Logged-in Users: $(who | wc -l)"
    echo "🔐 Failed Login Attempts: $(grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l)"
}

# Run all functions
echo "🔍 Server Performance Stats"
echo "----------------------------"
get_cpu_usage
echo ""
get_memory_usage
echo ""
get_disk_usage
echo ""
get_top_cpu_processes
echo ""
get_top_memory_processes
echo ""
get_optional_stats
echo ""

RESULTS
🔍 Server Performance Stats
----------------------------
📊 CPU Usage:
  Used: 14.6%

🛠 Memory Usage:
  Used: 11185MB / 15704MB (71.22%)

💾 Disk Usage:
  Used: 17G / 271G (7%)

🔥 Top 5 Processes by CPU Usage:
    PID COMMAND         %CPU
 106298 ps               100
   2979 firefox         29.8
   3239 Isolated Web Co 17.0
 104600 Isolated Web Co 11.3
   3063 RDD Process      8.9

📌 Top 5 Processes by Memory Usage:
    PID COMMAND         %MEM
   3239 Isolated Web Co  6.9
   3416 Isolated Web Co  5.7
   8736 WebKitWebProces  5.3
   2979 firefox          4.9
   3324 Isolated Web Co  4.4

🖥 OS Version: Arch Linux
⏳ Uptime: up 3 hours, 18 minutes
⚖ Load Average: 2.08, 1.65, 1.44
👥 Logged-in Users: 3
🔐 Failed Login Attempts: 0
