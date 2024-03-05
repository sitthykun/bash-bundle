# Bash Bundle! (2Bs)
![bash-bundle-1](https://user-images.githubusercontent.com/227092/76992204-7439e080-697d-11ea-9525-76388ed6d1e8.png)

It is a bash script that would assist web developer to optimize and combine the client-side(javascript, cascade style sheet) code into the separated files. At the end of processing, if there is no problem, it would create two files as **app.js** and **app.css**.\
Not like a traditional structure style, that we need use many files in head block, and keep them in order. 
Once a project becomes a big with many developers, it almost can mess around us.

My objective is, to make people smile by managing a less files, and keep a clean head.\
It's on the move.\
I'm happy to release a new version 1.4.3

## Getting started
```
== help ========
    ex:
    $ bash build-bundle.sh help
== init build-bundle env ========
    ex:
    $ bash build-bundle.sh init
== build by environment ========
The command below will run a default environment with keeping the reserve files
    ex:
    $ bash build-bundle.sh
pro is an environment that removes the reserve compression files
    ex:
    $ bash build-bundle.sh env=pro
with another environment
    ex:
    $ bash build-bundle.sh env=dev
== update the compression library ========
    ex:
    $ bash build-bundle.sh update

```

## Third parties require

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
	Local instaltion
	```
    $ npm install terser
	```
## Note**
If you don't wanna install each module, you just run the below to install all requirements by just a command.
```
$ bash build-bundle.sh init
```

## Structure Files

To start the script, the script requires some criteria folder and file structure below:\
figure 1:\
![clientside-folder-structure](https://user-images.githubusercontent.com/227092/76994224-a6007680-6980-11ea-96fb-ee6326a8ce1a.png)



**assets** is along a root folder with build-bundle.sh
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
$  sudo chmod +x build-bundle.sh
or
$  chmod +x build-bundle.sh

```
Then run command if it's production.
By default it won't need env=pro
```
$  ./build-bundle.sh env=pro
or
$ sh build-bundle.sh  env=pro
or
$ bash build-bundle.sh  env=pro
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
<img width="597" alt="Screenshot 2024-03-05 at 2 08 27 in the afternoon" src="https://github.com/sitthykun/bash-bundle/assets/227092/f95b9891-d157-4be6-ae71-734390c82697">

#### Check the files
figure 3:\
<img width="278" alt="Screenshot 2024-03-05 at 2 09 27 in the afternoon" src="https://github.com/sitthykun/bash-bundle/assets/227092/e46661a0-152c-41d8-9858-7c3c37c9e377">

To Support my work, please donate me via <a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/sitthykun"><img src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg" alt="Buy me a Pizza"><span style="margin-left:5px;font-size:28px !important;">Buy me a Coffee</span></a>
