# NebliyGSI - Nebliy Game Server Installer

This repository hosts automated game-server installation scripts.  
Each game has its own directory and a dedicated setup script.

## How It Works
- Each script installs all dependencies, downloads the game server, and creates a start file.
- You don’t need to clone the repository.  
  Just run the script directly from the raw GitHub URL.

The URL pattern is:
```
https://raw.githubusercontent.com/cansahinv/NebliyGSI/refs/heads/main/games/[GAME NAME]/nebliy-[GAME NAME].s
```

Example:
```
https://raw.githubusercontent.com/cansahinv/NebliyGSI/refs/heads/main/games/unturned/nebliy-unturned.sh
```