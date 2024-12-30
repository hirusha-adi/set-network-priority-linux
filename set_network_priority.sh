#!/bin/bash

# Display help message
function display_help {
    echo "Usage: $0 [--help]"
    echo ""
    echo "This script sets the IPv4 route metric (priority) for a specific network connection using its UUID."
    echo "You will be prompted to provide the connection UUID and the desired priority."
    echo ""
    echo "How Priorities Work:"
    echo "  - Lower values mean higher priority. For example:"
    echo "    - Priority 10 is higher than 20."
    echo "  - The system uses the connection with the highest priority (lowest value) when both are available."
    echo ""
    echo "Options:"
    echo "  --help      Show this help message and exit."
    echo ""
    echo "What You Need to Know:"
    echo "  - The UUID can be found using the command: nmcli connection show"
    echo "  - Typical priorities might look like this:"
    echo "    - WiFi: 10"
    echo "    - Ethernet: 20"
    echo ""
    echo "Examples:"
    echo "  To set the WiFi connection priority to 10:"
    echo "    ./set_network_priority.sh"
    echo "    Enter the connection UUID: f7250c36-9ee1-401f-8d1e-8acbcb3f8fe3"
    echo "    Enter the desired priority (lower values = higher priority): 10"
    echo ""
    echo "  To view all connections and their UUIDs:"
    echo "    nmcli connection show"
    echo ""
    echo "Important:"
    echo "  - Reactivating the connection will temporarily interrupt connectivity."
    echo "  - This script modifies the connection permanently until changed again."
    exit 0
}

# Check for --help flag
if [[ "$1" == "--help" ]]; then
    display_help
fi

# Prompt user for UUID
read -p "Enter the connection UUID: " uuid

# Prompt user for priority
read -p "Enter the desired priority (lower values = higher priority): " priority

# Validate inputs
if [[ -z "$uuid" ]]; then
    echo "Error: UUID cannot be empty."
    exit 1
fi

if ! [[ "$priority" =~ ^[0-9]+$ ]]; then
    echo "Error: Priority must be a numeric value."
    exit 1
fi

# Apply the route metric
nmcli connection modify "$uuid" ipv4.route-metric "$priority" && echo "Priority set successfully for UUID $uuid."

# Reactivate the connection
nmcli connection up "$uuid" && echo "Connection reactivated successfully."

# Verify the change
metric=$(nmcli connection show "$uuid" | grep -i 'ipv4.route-metric' | awk '{print $2}')
echo "The new priority for UUID $uuid is $metric."
