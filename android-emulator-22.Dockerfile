FROM ychescale9/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    qemu-kvm \
    libvirt-bin \
    ubuntu-vm-builder \
    bridge-utils \
    virtinst \
    cpu-checker \
    lib32stdc++6 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV PROCESSOR=x86 \
    SYS_IMG=x86 \
    IMG_TYPE=google_apis \
    API_LEVEL_22=22

# API 22 system image
RUN echo "y" | $ANDROID_HOME/tools/bin/sdkmanager "system-images;android-${API_LEVEL_22};${IMG_TYPE};${SYS_IMG}" \
    "platforms;android-${API_LEVEL_22}" \
    "emulator"

