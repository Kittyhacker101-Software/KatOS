# Source
This is where packaged files used in parts of KatOS are stored in various formats.
To download these files, type `./download.sh` into your terminal. This downloads about 100MB of files, and make take a while if you have a slow internet connection.

# Updating
To update files in here, drag the updated file into this folder, and then delete the older file.
Then, run the `build.sh` command in the folder where this file is used.
The updated file must have the same archive format as the older file, or this will not work.
Do not rename the new file, or the build script will fail to work properly.

# Issues
If you have any issues with the build scripts breaking due to an update, file an issue and notify me of the problem.
If you are having issues with the build scripts not detecting the updated file, make sure the older file is not present, and that the extention + naming scheme is similar to the older file.
