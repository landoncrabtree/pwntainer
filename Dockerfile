FROM ubuntu:latest

RUN apt update -y && \
    apt install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat-traditional \
    nano vim gdb python3-full python3-pip python3-dev file libssl-dev libffi-dev wget git make procps \
    libpcre3-dev libdb-dev libxt-dev libxaw7-dev tmux

RUN pip3 install --break-system-packages capstone requests pwntools r2pipe unicorn ropper meson ROPgadget
RUN git clone https://github.com/niklasb/libc-database /tools/libc-database
RUN git clone https://github.com/pwndbg/pwndbg /tools/pwndbg && cd /tools/pwndbg && ./setup.sh

# binja only
# RUN cd /tools && wget https://github.com/Vector35/debugger/releases/download/0.1/debugger-linux.zip && unzip debugger-linux.zip -d debugger && rm -rf debugger-linu*.zip

RUN wget https://gist.githubusercontent.com/kubaceg/a66f13d75392e3d9e59b/raw/de9b1d2ce184ac363d1276864a36d213c0f955bf/.bashrc -O /root/.bashrc

WORKDIR /pwn
EXPOSE 31337
