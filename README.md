Google-Home-Notifier
========================

This container uses Bonjour, so must use network_mode=host and open some ports (1900, 5350, 5351, 5353).

    firewall-cmd --add-port=1900/udp
    firewall-cmd --add-port=5350/udp
    firewall-cmd --add-port=5351/udp
    firewall-cmd --add-port=5353/udp
    docker run -e MESSAGE='How are you?' --network host knaou/google-home-notifier

* Environment
    * DEVICE: Set device name (default: "Google-Home")
    * MESSAGE: Set message(default: "Message is not set")

