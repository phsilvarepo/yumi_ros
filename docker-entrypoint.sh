#!/bin/bash

# Start the original Tiryoh entrypoint in the background (creates ubuntu user + starts VNC)
/entrypoint.sh &

# Wait for the VNC/desktop services and ubuntu user to be ready
sleep 5

# --- Setup workspace and bashrc for ubuntu ---
WORKSPACE=/home/ubuntu/catkin_ws
BASHRC=/home/ubuntu/.bashrc

# Ensure ROS_DISTRO is set
export ROS_DISTRO=${ROS_DISTRO:-noetic}

# Wait until ubuntu user exists
until id ubuntu &>/dev/null; do sleep 1; done
echo "User ubuntu READY!"

# Create .bashrc if it doesn't exist (copy from /etc/skel or create minimal one)
if [ ! -f "$BASHRC" ]; then
    echo "Creating .bashrc for ubuntu user..."
    if [ -f /etc/skel/.bashrc ]; then
        cp /etc/skel/.bashrc "$BASHRC"
    else
        # Create a minimal .bashrc
        cat > "$BASHRC" << 'EOF'
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOF
    fi
    chown ubuntu:ubuntu "$BASHRC"
fi

# Create workspace if it doesn't exist
if [ ! -d "$WORKSPACE/src" ]; then
    mkdir -p "$WORKSPACE/src"
    #chown -R ubuntu:ubuntu "$WORKSPACE"
fi

chown -R ubuntu:ubuntu "$WORKSPACE"

# Build the workspace as ubuntu
su - ubuntu -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd $WORKSPACE && catkin_make" || true

# Append ROS + workspace setup to bashrc if not already present
grep -qF "source /opt/ros/$ROS_DISTRO/setup.bash" "$BASHRC" || echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> "$BASHRC"
grep -qF "source $WORKSPACE/devel/setup.bash" "$BASHRC" || echo "source $WORKSPACE/devel/setup.bash" >> "$BASHRC"

# Optional: enable programmable completion features if not already
#grep -qxF "# enable programmable completion features" "$BASHRC" || cat << 'EOF' >> "$BASHRC"
## enable programmable completion features
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
#EOF

chown ubuntu:ubuntu "$BASHRC"

# --- Start rosbridge websocket server ---
echo "Starting rosbridge server on port ${ROSBRIDGE_PORT:-9090}..."
export ROSBRIDGE_PORT=${ROSBRIDGE_PORT:-9090}

# Run rosbridge as ubuntu
su - ubuntu -c "source /opt/ros/$ROS_DISTRO/setup.bash && roslaunch rosbridge_server rosbridge_websocket.launch port:=$ROSBRIDGE_PORT &"

# Keep the container running
wait
