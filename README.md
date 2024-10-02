# pwntainer

A Docker container for binary exploitation and dynamic reverse engineering. Designed for macOS users with Apple Silicon (M1/M2/M*) processors to be able to run and debug x86_64 binaries.

### Tools included:
- pwntools
- gdb & pwndbg
- strace, ltrace
- ropgadget
- libc-database

### Build:

```bash
# Install Docker Desktop and Colima
brew install --cask docker
brew install colima

# Create a new Docker context for Colima
colima start -p x64 -a x86_64 -c 8 -m 4 -d 10 --vm-type qemu --profile pwn

# Build and run the container
docker build -t pwn:pwn .
docker run --security-opt seccomp=unconfined --privileged --cap-add=SYS_PTRACE -p 31337:31337 -v ./:/pwn -it pwn:pwn bash

# If you want to switch back to Docker Desktop
# docker context use default
# docker context use colima
```

### Note for debugging x86_64 on Apple Silicon:

Docker Desktop utilizes Rosetta2 to run x86_64 binaries on Apple Silicon. Currently, this is [problematic](https://github.com/docker/for-mac/issues/6921) for debugging and usually requires setting `ROSETTA_DEBUGPORT` environment variable and connecting to the remote debugging port with GDB. In order to optimize the workflow, we use [Colima](https://github.com/abiosoft/colima) which emulates using QEMU. It is slower than Rosetta2, but provides seamless debugging experience.

Modified from [1ikeadragon](https://github.com/1ikeadragon/pwntainer)
Modified from [ScarletFireLabs](https://github.com/scarletfirelabs/docker-binaryexploitation).
