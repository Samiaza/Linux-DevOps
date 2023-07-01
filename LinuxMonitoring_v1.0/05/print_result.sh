#!/bin/bash

echo "Total number of folders (including all nested ones) = "`./num_of_folders.sh $1`
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
./folders_top.sh $1
echo "Total number of files = "`./num_of_files.sh $1`
echo "Number of:"
echo "Configuration files (with the .conf extension) = "`./num_of_conf.sh $1`
echo "Text files = "`./num_of_text.sh $1`
echo "Executable files = "`./num_of_exec.sh $1`
echo "Log files (with the extension .log) = "`./num_of_log.sh $1`
echo "Archive files = "`./num_of_archives.sh $1`
echo "Symbolic links = "`./num_of_syml.sh $1`
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
./files_top.sh $1
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
./exec_top.sh $1