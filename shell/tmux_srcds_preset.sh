#!/usr/bin/bash
# Rozrusznik serwera srcds w tmux

SESSION_NAME="default"
SRCDS_PATH="./srcds_run"
PORT="27015"
GAMEMODE="sandbox"
MAP="gm_construct"
MAX_PLAYERS="16"
WORKSHOP_COLLECTION=""
STEAM_TOKEN=""


if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Sesja $SESSION_NAME już działa. Dołączanie..."
    tmux attach -t $SESSION_NAME
    exit 0
fi

tmux new-session -d -s $SESSION_NAME "$SRCDS_PATH -game garrysmod -console -port $PORT +gamemode $GAMEMODE +map $MAP +maxplayers $MAX_PLAYERS +host_workshop_collection $WORKSHOP_COLLECTION +sv_setsteamaccount $STEAM_TOKEN"

echo "Serwer Garry's Mod został uruchomiony w sesji tmux: $SESSION_NAME"
echo "Aby dołączyć do konsoli: tmux attach -t $SESSION_NAME"