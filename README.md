# Bash Bundle! (2Bs)
![bash-bundle-1](https://user-images.githubusercontent.com/227092/76992204-7439e080-697d-11ea-9525-76388ed6d1e8.png)

It is a bash script that would assist web developer to optimize and combine the client-side(javascript, cascade style sheet) code into the separated files. At the end of processing, if there is no problem, it would create two files as **app.js** and **app.css**.\
Not like a traditional structure style, that we need use many files in head block, and keep them in order. 
Once a project becomes a big with many developers, it almost can mess around us.

My objective is, to make people smile by managing a less files, and keep a clean head. 

## Party Joiners

This bash script needs a couple Nodejs modules to optimize the code such as:
1. uglifycss: \
    is a port of [YUI Compressor](https://github.com/yui/yuicompressor) to [NodeJS](http://nodejs.org/) for its CSS part.
	#### Installation:
	Global installation uses -g
	```
    $ npm install uglifycss -g
    ```
	Local installation
	```
    $ npm install uglifycss
    ```
	
2. terser: A JavaScript parser and mangler/compressor toolkit for ES6+.
	#### Installation:
	```
    $ npm install terser -g
	```

## Structure Files

To start the script, the script requires some criteria folder and file structure below:\
figure 1:\
[image] clientside-folder-structure.png



**assets** is along a root folder with bash-bundle.sh
All module names has to name by using prefix as a digit that starts from 1 to 99.
Each module contains js and css folder that obtain files too.
All the files has to put prefix in order the same as module structure too.
It does not care about your suffix name 1_xxxxxx

> #### Note:
	  Please make sure by keeping files in order to avoid the reference
	  functions and variables are undefined or not found.

## Execute

Normally, the script is not be able to execute because of permission. Grant execute permission in short code
```
$  sudo chmod +x bash-bundle.sh
or
$  chmod +x bash-bundle.sh

```
Then
```
$  ./bash-bundle.sh
or
$ sh bash-bundle.sh
or
$ bash bash-bundle.sh
```
Output
```
Starting >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Combining CSS ...
Combining JS ...
Find them ...
 > ./assets/app.css
 > ./assets/app.js
Done <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
```

#### What it should be:
figure 2:\
[image] clientside-result-in-terminal.png
#### Check the files
figure 3:\
[image] clientside-result.png

##### from me: 
a little developer in the big world \o/
