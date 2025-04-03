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
