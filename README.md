# NebliyGSI - Nebliy Game Server Installer

This repository hosts automated game-server installation scripts.  
Each game has its own directory and a dedicated setup script.

## How It Works
- Each script installs all dependencies, downloads the game server, and creates a start file.
- You don’t need to clone the repository.  
  Just run the script directly from the raw GitHub URL.

> [!CAUTION]
> The script for the game you want may not be available as I am still developing my software. You can check the games folder to see if the game you want is available.

The URL pattern is:
```
https://raw.githubusercontent.com/cansql/NebliyGSI/refs/heads/main/games/[GAME NAME]/nebliy-[GAME NAME].sh
```

Example URL:
```
https://raw.githubusercontent.com/cansql/NebliyGSI/refs/heads/main/games/unturned/nebliy-unturned.sh
```

Now that we understand the URL structure, we can download the script.
---
## 🤝 Supported Games

Unturned

---
## 🚀 How to Use

1. **Download the script:**
```bash
sudo wget https://raw.githubusercontent.com/cansql/NebliyGSI/refs/heads/main/games/[GAME NAME]/nebliy-[GAME NAME].sh
```

2. **Make it executable:**
```bash
chmod +x nebliy-[GAME NAME].sh
```

3. **Run it:**
```bash
./nebliy-[GAME NAME].sh
```
