#!/bin/bash

# Start the original Tiryoh entrypoint in the background (creates ubuntu user + starts VNC)
/entrypoint.sh &

# Wait for the VNC/desktop services and ubuntu user to be ready
sleep 5

# --- Setup workspace and bashrc for ubuntu ---
WORKSPACE=/home/ubuntu/catkin_ws
BASHRC=/home/ubuntu/.bashrc

# Ensure ROS_DISTRO is set
export ROS_DISTRO=${ROS_DISTRO:-humble}

# Wait until ubuntu user exists
until id ubuntu &>/dev/null; do sleep 1; done
echo "User ubuntu READY!"

# Create workspace if it doesn't exist
if [ ! -d "$WORKSPACE/src" ]; then
    mkdir -p "$WORKSPACE/src"
    #chown -R ubuntu:ubuntu "$WORKSPACE"
fi

chown -R ubuntu:ubuntu "$WORKSPACE"

# Build the workspace as ubuntu
su - ubuntu -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd $WORKSPACE && catkin_make" || true

# Append ROS2 + workspace setup to bashrc if not already present
grep -qxF "source /opt/ros/$ROS_DISTRO/setup.bash" "$BASHRC" || echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> "$BASHRC"
grep -qxF "source $WORKSPACE/devel/setup.bash" "$BASHRC" || echo "source $WORKSPACE/devel/setup.bash" >> "$BASHRC"

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
