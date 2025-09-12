#!/bin/bash
# Web Site: Nebliy.com
# Author: cansql

INSTALL_DIR="$HOME/unturned-server"
STEAMCMD_DIR="$HOME/steamcmd"

echo "=== Unturned Server Setup Script ==="

# 1. Check if installation already exists
if [ -d "$INSTALL_DIR" ]; then
    echo "Warning: A server is already installed in $INSTALL_DIR."
    read -p "Cancel installation? (Y/N): " cancel
    if [[ "$cancel" =~ ^[Yy]$ ]]; then
        echo "Installation canceled."
        exit 0
    else
        echo "Setup not continued. Exiting."
        exit 0
    fi
fi

# 2. Update packages and install dependencies
read -p "Required packages will be installed. Continue? (Y/N): " pkgs
if [[ "$pkgs" =~ ^[Yy]$ ]]; then
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y lib32gcc-s1 lib32stdc++6 curl tar
else
    echo "Package installation skipped. Cannot continue."
    exit 1
fi

# 3. Install SteamCMD
read -p "Download and install SteamCMD? (Y/N): " steamq
if [[ "$steamq" =~ ^[Yy]$ ]]; then
    mkdir -p "$STEAMCMD_DIR" && cd "$STEAMCMD_DIR"
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
else
    echo "SteamCMD is required. Installation canceled."
    exit 1
fi

# 4. Install Unturned server
read -p "Download Unturned server files? (Y/N): " gameq
if [[ "$gameq" =~ ^[Yy]$ ]]; then
    mkdir -p "$INSTALL_DIR"
    "$STEAMCMD_DIR/steamcmd.sh" +login anonymous +force_install_dir "$INSTALL_DIR" +app_update 1110390 validate +quit
else
    echo "Installation canceled."
    exit 1
fi

# 5. Create start script
cat > "$INSTALL_DIR/start.sh" <<'EOF'
#!/bin/bash
cd "$(dirname "$0")"
./Unturned_Headless.x86_64 -nographics -batchmode +InternetServer/MyServer
EOF
chmod +x "$INSTALL_DIR/start.sh"

echo "Installation complete!"
echo "To start the server: $INSTALL_DIR/start.sh"
