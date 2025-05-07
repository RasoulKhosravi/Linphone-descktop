FROM ubuntu:23.10

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install base tools and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    cmake \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    doxygen \
    graphviz \
    nasm \
    ninja-build \
    yasm \
    pkg-config \
    meson \
    libasound2-dev \
    libpulse-dev \
    libv4l-dev \
    libglew-dev \
    libgl1-mesa-dev \
    qt6-base-dev \
    qt6-declarative-dev \
    qt6-tools-dev \
    qt6-svg-dev \
    qt6-multimedia-dev \
    libssl-dev \
    libsqlite3-dev \
    libmbedtls-dev \
    libxml2-dev \
    libjpeg-dev \
    libxv-dev \
    libxcomposite-dev \
    libxrender-dev \
    libx11-dev \
    libxext-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone Linphone Desktop with submodules
RUN git clone --recursive https://gitlab.linphone.org/BC/public/linphone-desktop.git .

# Create build directory
RUN mkdir -p /app/build

# Configure build
WORKDIR /app/build
RUN cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_APP_PACKAGING=NO -DENABLE_BUILD_DEPENDENCIES=ON

# Build
RUN cmake --build . --parallel $(nproc)

# Set final working directory to output binary location
WORKDIR /app/build/OUTPUT/bin

# Default command to run Linphone
CMD ["./linphone"]
