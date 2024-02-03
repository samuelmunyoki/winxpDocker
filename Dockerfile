# Use the base image with Windows
FROM dockurr/windows

# Set container name
ENV container_name=windows

# Mount KVM device
RUN mkdir -p /dev/kvm

# Add NET_ADMIN capability
RUN setcap cap_net_admin+eip /usr/bin/qemu-system-x86_64

# Expose ports
EXPOSE 8006 3389/tcp 3389/udp

# Set stop grace period and restart policy
STOPSIGNAL SIGRTMIN+3
CMD ["sh", "-c", "trap : TERM INT; sleep infinity & wait"]

# Set environment variables
ENV VERSION="winxp" \
    RAM_SIZE="0.25G" \
    CPU_CORES="2"
