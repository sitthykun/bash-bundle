# Bash Bundle! (2Bs)
![bash-bundle-1](https://user-images.githubusercontent.com/227092/76992204-7439e080-697d-11ea-9525-76388ed6d1e8.png)

It is a bash script that would assist web developer to optimize and combine the client-side(javascript, cascade style sheet) code into the separated files. At the end of processing, if there is no problem, it would create two files as **app.js** and **app.css**.\
Not like a traditional structure style, that we need use many files in head block, and keep them in order. 
Once a project becomes a big with many developers, it almost can mess around us.

My objective is, to make people smile by managing a less files, and keep a clean head.\
It's on the move.\
I'm happy to release a new version 1.4.5

## Roadmap
| Version  | Date  | Description  |
|---|---|---|
|  1.4.3 | 2024-Jan  | Clean up  |
|  1.4.4 | 2024-Mar   | Fix environment  |
|  1.4.5 | 2024-Mar  | Add new line while merging every file and clear a file before merge was fix  |
|  1.4.6 | 2024-Mar   | Fix empty file  |

## Command list
```
----------------------------------------------------------------------------------
//-- help ------------------------------------------------------------------------
    $ bash build-bundle.sh help

----------------------------------------------------------------------------------
//-- init build-bundle env -------------------------------------------------------
    $ bash build-bundle.sh init

----------------------------------------------------------------------------------
//-- build by environment --------------------------------------------------------
  The command below will run a default environment with keeping the reserve files
    $ bash build-bundle.sh

  pro is an environment that removes the reserve compression files
    $ bash build-bundle.sh env=pro

  with another environment
    $ bash build-bundle.sh env=dev

----------------------------------------------------------------------------------
//-- update the compression libraries --------------------------------------------
    $ bash build-bundle.sh update

```

## First step
Prepare your structue files like below or look at figure 1

> #### Note:
	  Please make sure by keeping files in order to avoid the reference
	  functions and variables are undefined or not found.
```
assests
	| modules
		| 0_module1
		| 1_module2
			| css
				| 0_name.css
			| js
				| 0_name.js
```

## Second step
Download bash-bundle.sh and copy to alongside of your 'assets' directory
**assets**
All module names has to name by using prefix as number and add underscore '_'.
The number must be positive value, it has to starts from 0 to 99.
Each module name has to contains js and css folder that obtain files too.
All the files has to put prefix in order the same as module structure too.
It does not care about your suffix name 1_xxxxxx

figure 1:\
![clientside-folder-structure](https://user-images.githubusercontent.com/227092/76994224-a6007680-6980-11ea-96fb-ee6326a8ce1a.png)

## Third step
This bash file requires 'Nodejs' and 'NPM' are already installation to compress those js and css.
Then it will start installing any dependencies base on npm package requirements
```
$ bash build-bundle.sh init
```
If you wanna manually install npm's package
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
## Execute

Normally, the script is not be able to execute because of permission. \
Grant execute permission in short code
```
$ sudo chmod +x build-bundle.sh
or
$ chmod +x build-bundle.sh
```
Start now
```
$ bash build-bundle.sh
```
Then it overwrites and/or created 4 files.
1. app.base.css
2. app.css
3. app.base.js
4. app.js

> #### Note:
'app.base.css' and 'app.base.js' are not yet compress.
It makes us to know the plain structure and easy to track any error.
```
Starting >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Combining CSS ...
Combining JS ...
Find them ...
> ./assets/app.base.css
> ./assets/app.css
> ./assets/app.base.js
> ./assets/app.js
Done <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
```
> #### Note:
In production, please add argument 'env=pro' to remove 'app.base.css' and 'app.base.js'.\
By default it won't need env=pro
```
$ ./build-bundle.sh env=pro
or
$ sh build-bundle.sh env=pro
or
$ bash build-bundle.sh env=pro
```
figure 2:\
<img width="597" alt="Screenshot 2024-03-05 at 2 08 27 in the afternoon" src="https://github.com/sitthykun/bash-bundle/assets/227092/f95b9891-d157-4be6-ae71-734390c82697">

#### Finally, 'app.js' and 'app.css' were generated in your drive if everything worked properly.
figure 3:\
<img width="264" alt="Screenshot 2024-03-05 at 2 19 31 in the afternoon" src="https://github.com/sitthykun/bash-bundle/assets/227092/8212f4da-56e7-455b-b6ea-9840f991743d">

To Support my work, please donate me via <a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/sitthykun"><img src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg" alt="Buy me a Pizza"><span style="margin-left:5px;font-size:28px !important;">Buy me a Coffee</span></a>
