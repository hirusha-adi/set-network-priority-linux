# Set network priority easily (Linux)

### Setup

- **Get `set_network_priority.sh`**

```bash
wget "https://raw.githubusercontent.com/hirusha-adi/set-network-priority-linux/refs/heads/main/set_network_priority.sh"
```

- **Save and make it executable**

```bash
chmod +x set_network_priority.sh
```

- **See help**

```bash
./set_network_priority.sh --help
```

- [Retrieve Network UUIDs](#retrieve-network-uuids)

- **Run the script**

```bash
./set_network_priority.sh
```

---

### Retrieve Network UUIDs

To get the UUIDs of your network connections, use the following command:

```bash
nmcli connection show
```

This will display a list of all available connections. Look for the `NAME` of the connection you want to modify and note down its corresponding `UUID`. Below is an example output:

```plaintext
NAME                UUID                                  TYPE      DEVICE
Hirusha123          f7250c36-9ee1-401f-8d1e-8acbcb3f8fe3  wifi      wlan0
Wired connection 2  68e0ae68-a35b-3bc1-b80a-c74b09c768f3  ethernet  enp5s0
docker0             33808f7a-32cc-4d53-8515-1da90caa81bf  bridge    docker0
```

In this example:

- The UUID for WiFi (`Hirusha123`) is `f7250c36-9ee1-401f-8d1e-8acbcb3f8fe3`.
- The UUID for Ethernet (`Wired connection 2`) is `68e0ae68-a35b-3bc1-b80a-c74b09c768f3`.

Use the corresponding UUID when prompted by the script.

---

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
