# Alpine with Bison, Flex and GDB

This image provides a build and debug environment for Bison, Flex and therefore C files. All images do also provide SSH which is useful for Windows users.

The image provides SSH at port *22* and a **VOLUME** at */git*

## Tags

### latest

This container provides the [gdbgui](https://gdbgui.com/) as remote server for debugging.

exposes the gdbgui at port 5000

### vnc

This container provides the [gnu ddd](https://www.gnu.org/software/ddd/) for debugging which can be accessed through VNC.

exposes the VNC at port 5900
