#! /bin/bash

set -e;

# process group conflict
if getent group $HOST_GID > /dev/null 2>&1; then
    EXISTING_GROUP=$(getent group $HOST_GID | cut -d: -f1);
    echo "Using existing group: $EXISTING_GROUP (GID: $HOST_GID)";
    GROUP_NAME="$EXISTING_GROUP";
else \
    GROUP_NAME="$HOST_USER";
    groupadd -g $HOST_GID $GROUP_NAME;
    echo "Created new group: ${GROUP_NAME} (GID: $HOST_GID)";
fi;

# process user conflict
if getent passwd $HOST_UID > /dev/null 2>&1; then
    EXISTING_USER=$(getent passwd $HOST_UID | cut -d: -f1);
    echo "User with UID $HOST_UID already exists: $EXISTING_USER";
    echo "Modifying existing user to match host configuration...";
    if [ "$EXISTING_USER" = "$HOST_USER" ]; then
        echo "Existing user name of UID ${HOST_UID} matches target user name ${HOST_USER}}.";
        usermod -g $GROUP_NAME -s /bin/bash $HOST_USER;
    else
        echo "Changing username from $EXISTING_USER to $HOST_USER";
        usermod -l ${HOST_USER} ${EXISTING_USER};
        usermod -g $GROUP_NAME -d /home/$HOST_USER -m -s /bin/bash $HOST_USER;
    fi;
else
    echo "Created new user: $HOST_USER (UID: $HOST_UID)";
    useradd -m -u $HOST_UID -g $GROUP_NAME -s /bin/bash $HOST_USER;
fi;

echo "Configuring environment variables for user $HOST_USER..."

# export environment variables to user's .bashrc
BASHRC_PATH="/home/$HOST_USER/.bashrc"

# ensure .bashrc exists
[ ! -f "$BASHRC_PATH" ] && touch "$BASHRC_PATH"

# remove old environment variables (if exists)
sed -i '/export USER=/d' "$BASHRC_PATH"

# add new environment variables
{
    echo ""
    echo "# add user environment variables"
    echo "export USER=$HOST_USER"
} >> "$BASHRC_PATH"

# set correct ownership
chown $HOST_USER:$GROUP_NAME "$BASHRC_PATH"

# sudo no password
if ! grep -q "^$HOST_USER" /etc/sudoers 2>/dev/null; then
    echo "$HOST_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers;
    echo "Added $HOST_USER to sudoers";
else
    echo "User $HOST_USER already in sudoers";
fi
