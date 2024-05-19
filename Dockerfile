FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y python3.10 \
    python3-pip \
    xvfb \
    zip \
    wget \
    ca-certificates \
    libnss3-dev \
    libasound2 \
    libxss1 \
    libappindicator3-1 \
    libindicator7 \
    gconf-service \
    libgconf-2-4 \
    libpango1.0-0 \
    xdg-utils \
    fonts-liberation \
    libcurl3-gnutls \
    libcurl3-nss \
    libcurl4 \
    libgbm1 \
    libu2f-udev \
    libvulkan1 && \
    apt-get clean
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    rm -f google-chrome-stable_current_amd64.deb
RUN wget -N https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.60/linux64/chromedriver-linux64.zip
RUN unzip chromedriver-linux64.zip
RUN mv chromedriver-linux64/chromedriver /usr/local/bin
RUN chmod +x /usr/local/bin/chromedriver
RUN rm -f chromedriver-linux64.zip
RUN rm -rf chromedriver-linux64
COPY requirements.txt .
RUN pip install -r requirements.txt
