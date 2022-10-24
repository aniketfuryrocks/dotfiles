#! /bin/sh

VERSION="v1.8.1"
NAME="codelldb-x86_64-linux"
echo "Installing $NAME $VERSION"
mkdir $NAME 
cd $NAME
wget "https://github.com/vadimcn/vscode-lldb/releases/download/$VERSION/$NAME.vsix" 
unzip "$NAME.vsix"
rm "$NAME.vsix"
