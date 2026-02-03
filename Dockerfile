# Build-time argument for ROS distro (default to humble)
ARG ROS_DISTRO=noetic
FROM tiryoh/ros-desktop-vnc:${ROS_DISTRO}

# Switch to root for installation
USER root
SHELL ["/bin/bash", "-c"]

# Fix keyring and update apt
RUN rm /usr/share/keyrings/ros-archive-keyring.gpg \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && apt update

# Install additional ROS packages
RUN apt-get install -y \
    ros-${ROS_DISTRO}-rosbridge-suite \
    ros-${ROS_DISTRO}-joint-state-publisher* \
    ros-${ROS_DISTRO}-robot-state-publisher* \
    ros-${ROS_DISTRO}-controller-manager \
    ros-${ROS_DISTRO}-ros-control \
    ros-${ROS_DISTRO}-moveit \
    ros-${ROS_DISTRO}-moveit-core \
    ros-${ROS_DISTRO}-moveit-ros \
    ros-${ROS_DISTRO}-moveit-ros-planning \
    ros-${ROS_DISTRO}-moveit-ros-planning-interface \
    ros-${ROS_DISTRO}-moveit-ros-visualization \
    ros-${ROS_DISTRO}-moveit-ros-perception \
    && rm -rf /var/lib/apt/lists/*

# Set ROSBRIDGE port env
ENV ROSBRIDGE_PORT=9090

# Expose rosbridge websocket port
EXPOSE ${ROSBRIDGE_PORT}

RUN mkdir -p /home/ubuntu/catkin_ws/src
WORKDIR /home/ubuntu/catkin_ws/src

RUN git clone https://andre.lourenco:glpat-qH5Sf0Eh51JXwGUnFhcbcm86MQp1OjR3a2I5Cw.01.1219cu76o@gitlab.com/atlas_incm/ros_utils.git
RUN git clone https://andre.lourenco:glpat-qH5Sf0Eh51JXwGUnFhcbcm86MQp1OjR3a2I5Cw.01.1219cu76o@gitlab.com/atlas_incm/moveit_commander.git

COPY yumi_description  /home/ubuntu/catkin_ws/src/yumi_description
COPY yumi_moveit_config /home/ubuntu/catkin_ws/src/yumi_moveit_config

# Copy entrypoint script
COPY docker-entrypoint.sh /opt/ros_entrypoint.sh
RUN chmod +x /opt/ros_entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/opt/ros_entrypoint.sh"]
CMD ["roslaunch", "rosbridge_server", "rosbridge_websocket.launch"]
