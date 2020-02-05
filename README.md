# Alpine with Bison, Flex and GDB

This image provides a build and debug environment for Bison, Flex and therefore C files. All images do also provide SSH which is useful for Windows users.

The image provides SSH at port *22* and a **VOLUME** at */git*

## Tags

### gdbgui (latest)

This container provides the [gdbgui](https://gdbgui.com/) as remote server for debugging.

exposes the gdbgui at port 5000

### vnc

This container provides the [gnu ddd](https://www.gnu.org/software/ddd/) for debugging which can be accessed through VNC.

exposes the VNC at port 5900

## Example Powershell script

The script runs a new container or starts an existing one.

````Powershell

# convert the given path to a valid docker toolbox path
function Path-For-Docker($PATH){
    $PATH=(($PATH -replace "\\","/") -replace ":","").Trim("/")

    [regex]$regex='^[a-zA-Z]/'
    $PATH=$regex.Replace($PATH, {$args[0].Value.ToLower()})

    $PATH="//$PATH"
    return $PATH
}

$MOUNT_PATH = Path-For-Docker -Path ${pwd}
$CONTAINER_NAME="bisonflexgdb"
$IMAGE_NAME = "birddock/alpine-bisonflex"

# find existing container
$CONTAINER_ID=docker ps -a -q -f name=$CONTAINER_NAME

Write-Output $MOUNT_PATH

if($CONTAINER_ID){
    docker start $CONTAINER_ID
}
else{
    docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d -v "${MOUNT_PATH}://git" -p 5000:5000 -p 2222:22 --name $CONTAINER_NAME $IMAGE_NAME
}

````
