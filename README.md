# Bash Bundle! (2Bs)
![bash-bundle-1](https://user-images.githubusercontent.com/227092/76992204-7439e080-697d-11ea-9525-76388ed6d1e8.png)

It is a bash script that would assist web developer to optimize and combine the client-side(javascript, cascade style sheet) code into the separated files. At the end of processing, if there is no problem, it would create two files as **app.js** and **app.css**.\
Not like a traditional structure style, that we need use many files in head block, and keep them in order. 
Once a project becomes a big with many developers, it almost can mess around us.

My objective is, to make people smile by managing a less files, and keep a clean head. 

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
	```
    $ npm install terser -g
	```

## Structure Files

To start the script, the script requires some criteria folder and file structure below:\
figure 1:\
![clientside-folder-structure](https://user-images.githubusercontent.com/227092/76994224-a6007680-6980-11ea-96fb-ee6326a8ce1a.png)



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
Then run command if it's production.
By default it won't need env=pro
```
$  ./bash-bundle.sh env=pro
or
$ sh bash-bundle.sh  env=pro
or
$ bash bash-bundle.sh  env=pro
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
![clientside-result](https://user-images.githubusercontent.com/227092/76994375-db0cc900-6980-11ea-8b13-7f0ce8f616d1.png)

#### Check the files
figure 3:\
![clientside-result-in-terminal](https://user-images.githubusercontent.com/227092/76994330-cb8d8000-6980-11ea-828a-74423e948b72.png)

To Support my work, please donate me via <a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/sitthykun"><img src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg" alt="Buy me a Pizza"><span style="margin-left:5px;font-size:28px !important;">Buy me a Coffee</span></a>
