# Welcome to Bash Bundle!

It is a bash script that would assist web developer to optimize and combine the client-side code into the separated files. At the end of processing, it will create two files as **app.js** and **app.css**.

# Party Joiners

This bash script needs a couple Nodejs modules to optimize the code such as:
1. uglifycss: UglifyCSS is a port of [YUI Compressor](https://github.com/yui/yuicompressor) to [NodeJS](http://nodejs.org/) for its CSS part. Its name is a reference to the awesome [UglifyJS](https://github.com/mishoo/UglifyJS) but UglifyCSS is not a CSS parser. Like YUI CSS Compressor, it applies many regexp replacements. Note that a [port to JavaScript](https://github.com/yui/ycssmin) is also available in the YUI Compressor repository.
	> #### Installation:
		> `$ npm install uglifycss -g`
2. terser: A JavaScript parser and mangler/compressor toolkit for ES6+.
	> #### Installation:
		> `$ npm install uglifycss -g`

# Structure Files

To start the script, the script requires some criteria folder and file structure below:
![clientside-folder-structure]
(clientside-folder-structure.png)



assets is along a root folder with bash-bundle.sh
All module names has to name prefix as a digit that starts from 1 to 99.
Each module contains js and css folder that obtain files too.
All the files has to name prefix in order the same as module structure too.
It does not care about your suffix name 1_xxxxxx

> #### Note:
	>  Please make sure by keeping files in order to avoid the referent
	>  functions and variables are undefined or not found.

# Execute

Normally, the script is not able to execute because of permission. Grant execute permission in short code
> `$  chmod +x bash-bundle.sh`
Then
> `$  ./bash-bundle.sh`

#### What it should be:
![clientside-result-in-terminal]
(clientside-result-in-terminal.png)
#### Check the files
![clientside-result]
(clientside-result.png)
