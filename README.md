# Set network priority easily (Linux)

### Setup

- Get `set_network_priority.sh`

```bash
wget "https://raw.githubusercontent.com/hirusha-adi/set-network-priority-linux/refs/heads/main/set_network_priority.sh"
```

- Save and make it executable

```bash
chmod +x set_network_priority.sh
```

- See basic guide

```bash
chmod +x set_network_priority.sh
```

- See help

```bash
./set_network_priority.sh --help
```

- Run the script

```bash
./set_network_priority.sh
```

### Help

```
Usage: ./set_network_priority.sh [--help]

This script sets the IPv4 route metric (priority) for a specific network connection using its UUID.
You will be prompted to provide the connection UUID and the desired priority.

How Priorities Work:
  - Lower values mean higher priority. For example:
    - Priority 10 is higher than 20.
  - The system uses the connection with the highest priority (lowest value) when both are available.

Options:
  --help      Show this help message and exit.

What You Need to Know:
  - The UUID can be found using the command: nmcli connection show
  - Typical priorities might look like this:
    - WiFi: 10
    - Ethernet: 20

Examples:
  To set the WiFi connection priority to 10:
    ./set_network_priority.sh
    Enter the connection UUID: f7250c36-9ee1-401f-8d1e-8acbcb3f8fe3
    Enter the desired priority (lower values = higher priority): 10

  To view all connections and their UUIDs:
    nmcli connection show

Important:
  - Reactivating the connection will temporarily interrupt connectivity.
  - This script modifies the connection permanently until changed again.
```
