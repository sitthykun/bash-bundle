#!/bin/bash
# author: masakokh
# year: 2024
# note: build client bundle
# version: 1.4.3
# argument command
CMD_KEY=''
CMD_VALUE=''
# command list
CMD_LIST_ENV='env'
CMD_LIST_HELP='help'
CMD_LIST_INIT='init'
CMD_LIST_UPDATE='update'
# environment
ENV_PRO='pro'

# declare variables
RootPath=./assets/
ModulePath="$RootPath"module
# name
AppCss="$RootPath"app.css
AppCssBase="$RootPath"app.base.css
AppJs="$RootPath"app.js
AppJsBase="$RootPath"app.base.js
# dir
AppJsDirPatterns=($ModulePath/[0-9]_*/js/[0-9]_*.js $ModulePath/[0-9]_*/js/[0-9][0-9]_*.js $ModulePath/[0-9][0-9]_*/js/[0-9]_*.js $ModulePath/[0-9][0-9]_*/js/[0-9][0-9]_*.js)
AppCssDirPatterns=($ModulePath/[0-9]_*/css/[0-9]_*.css $ModulePath/[0-9]_*/css/[0-9][0-9]_*.css $ModulePath/[0-9][0-9]_*/css/[0-9]_*.css $ModulePath/[0-9][0-9]_*/css/[0-9][0-9]_*.css)

# production environment
isPro=0

# cmd
doCmd()
{
	# find any condition
	for opt in "$@" ; do
		# get command
		CMD_KEY="${opt%=*}"
		CMD_VALUE="${opt#*=}"

		# filter cmd
		if [[ ${CMD_KEY} = ${CMD_LIST_INIT} ]] ; then
			# call initilize build-bundle
			doInit
			# exit code
			exit 0
		fi

		# filter cmd
		if [[ ${CMD_KEY} = ${CMD_LIST_HELP} ]] ; then
			# call help build-bundle
			doHelp
			# exit code
			exit 0
		fi

		# filter environment
		if [[ ${CMD_KEY} = ${CMD_LIST_ENV} ]] ; then
			# production environment
			if [[ ${CMD_VALUE} = ${ENV_PRO} ]] ; then
				echo "The environment is $ENV_PRO"
				isPro=1
				break
			fi
		fi

		# filter update package
		if [[ ${CMD_KEY} = ${CMD_LIST_UPDATE} ]] ; then
			# call update build-bundle
			doUpdate
			# exit code
			exit 0
		fi

	done
}

# css task
doCss()
{
	# inform
	echo -e "\e[93mCombining CSS ..."

	# create app file
	if [ ! -e $AppCss ]; then
        	touch $AppCss
	else
		truncate -s 0 $AppCss
	fi

	# create base file
	if [ ! -e $AppCssBase ]; then
        	touch $AppCssBase
	fi

	# find all in list
	for FileCss in ${AppCssDirPatterns[@]}
	do
		# check file first
		if [ -f "$FileCss" ]; then
	        	echo " > $FileCss";
			# merge css
			cat $FileCss >> $AppCssBase;
		fi
	done

	# compress
	node_modules/uglifycss/uglifycss $AppCssBase > $AppCss

	# check environment
	if [ isPro ]; then
		# remove base file
		rm $AppCssBase
	fi
}

# help
doHelp()
{
  # man
  echo "== help ========"
  echo "    ex:"
  echo "    $ bash build-bundle.sh help"

  echo "== init build-bundle env ========"
  echo "    ex:"
  echo "    $ bash build-bundle.sh init"

  echo "== build by environment ========"
  echo "The command below will run a default environment with keeping the reserve files"
  echo "    ex:"
  echo "    $ bash build-bundle.sh"
  echo "pro is an environment that removes the reserve compression files"
  echo "    ex:"
  echo "    $ bash build-bundle.sh env=pro"
  echo "with another environment"
  echo "    ex:"
  echo "    $ bash build-bundle.sh env=dev"

  echo "== update the compression library ========"
  echo "    ex:"
  echo "    $ bash build-bundle.sh update"
}

# install js tools
doInit()
{
	# inform
	echo -e "\e[93mInitialize ..."
	# update npm
	# more: https://docs.npmjs.com/try-the-latest-stable-version-of-npm
	#npm install -g npm@latest

	echo -e "\e[93mInstalling uglifycss ..."
	# optimize css
	npm install uglifycss

	echo -e "\e[93mInstalling terser ..."
	# optimize js
	npm install terser
}

# javascript task
doJs()
{
	# inform
	echo -e "\e[93mCombining JS ..."

	# create app file
	if [ ! -e $AppJsBase ]; then
		touch $AppJsBase
	fi

	# create base file
	if [ ! -e $AppJs ]; then
		touch $AppJs
	else
		truncate -s 0 $AppJs
	fi

	# find all in list
	for FileJs in ${AppJsDirPatterns[@]}
	do
		# check file first
		if [ -f "$FileJs" ]; then
			echo " > $FileJs";
			# merge js
			cat $FileJs >> $AppJsBase;
		fi
	done

	# compress
	node_modules/terser/bin/terser $AppJsBase -o $AppJs

	# check environment
	if [ isPro ]; then
		# remove base file
		rm $AppJsBase
	fi
}

# inform
doResult()
{
	echo -e "\e[93mFind them ..."
	echo " > $AppCss"
	echo " > $AppJs"
}

# update library
doUpdate()
{
	# Update
	echo -e "\e[93mUpdating ..."
	# optimize css
	npm update

	echo -e "\e[93mFinishing ..."
}

# print out third party versions
printVersion()
{
	node_modules/uglifycss/uglifycss --version
	node_modules/terser/bin/terser --version
}

# check cmd
doCmd $@

# print out third party versions
printVersion

# start block
echo -e "\e[92mStarting >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# css starting
doCss
# js starting
doJs
# output path
doResult
# end block
echo -e "\e[92mDone <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
