#!/bin/bash
# author: masakokh
# year: 2024
# note: build client bundle
# version: 1.4.8
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
ModulePath="$RootPath"modules
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
			# call initialize bash-bundle
			doInit
			# exit code
			exit 0
		fi

		# filter cmd
		if [[ ${CMD_KEY} = ${CMD_LIST_HELP} ]] ; then
			# call help bash-bundle
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
			# call update bash-bundle
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
	printf "\n\e[93mCombining CSS ..."

	# create app file
	if [ ! -e $AppCss ]; then
        touch $AppCss
	else
	  	# linux and mac
	  	# truncate -s 0 $AppCss
    	cat /dev/null > $AppCss
	fi

	# create base file
	if [ ! -e $AppCssBase ]; then
    	touch $AppCssBase
	else
		# linux and mac
	  	# truncate -s 0 $AppJsBase
    	cat /dev/null > $AppCssBase
	fi

	# find all in list
	for FileCss in ${AppCssDirPatterns[@]}
	do
		# check file first
		if [ -f "$FileCss" ]; then
	    echo " > $FileCss";
			# add new line
			echo "" >> $AppCssBase;
			# merge file
			cat $FileCss >> $AppCssBase;
		fi
	done

	# compress
	node_modules/uglifycss/uglifycss $AppCssBase > $AppCss

	# check environment
	if [ "$isPro" -gt 0 ]; then
		# remove base file
		rm $AppCssBase
	fi
}

# help
doHelp()
{
  # man
  echo "----------------------------------------------------------------------------------"
  echo "//-- help ------------------------------------------------------------------------"
  echo "    $ bash bash-bundle.sh help"
  echo " "
  echo "----------------------------------------------------------------------------------"
  echo "//-- init bash-bundle env --------------------------------------------------------"
  echo "    $ bash bash-bundle.sh init"
  echo " "
  echo "----------------------------------------------------------------------------------"
  echo "//-- the use of an environment ---------------------------------------------------"
  echo "  The command below will run a default environment with keeping the reserve files"
  echo "    $ bash bash-bundle.sh"
  echo "  pro is an environment that removes the reserve compression files"
  echo "    $ bash bash-bundle.sh env=pro"
  echo "  with another environment"
  echo "    $ bash bash-bundle.sh env=dev"
  echo " "
  echo "----------------------------------------------------------------------------------"
  echo "//-- update the compression libraries --------------------------------------------"
  echo "    $ bash bash-bundle.sh update"
}

# install js tools
doInit()
{
	# inform
	printf "\n\e[93mInitialize ..."
	# update npm
	# more: https://docs.npmjs.com/try-the-latest-stable-version-of-npm
	#npm install -g npm@latest

	printf "\n\e[93mInstalling uglifycss ..."
	# optimize css
	npm install uglifycss

	printf "\n\e[93mInstalling terser ..."
	# optimize js
	npm install terser
}

# javascript task
doJs()
{
	# inform
	printf "\n\e[93mCombining JS ..."

	# create app file
	if [ ! -e $AppJsBase ]; then
		touch $AppJsBase
	else
		# linux and mac
		# truncate -s 0 $AppJsBase
		cat /dev/null > $AppJsBase
	fi

	# create base file
	if [ ! -e $AppJs ]; then
		touch $AppJs
	else
		# linux and mac
		# truncate -s 0 $AppJs
    	cat /dev/null > $AppJs
	fi

	# find all in list
	for FileJs in ${AppJsDirPatterns[@]}
	do
		# check file first
		if [ -f "$FileJs" ]; then
			echo " > $FileJs";
			# add new line
			echo "" >> $AppJsBase;
			# merge file
			cat $FileJs >> $AppJsBase;
		fi
	done

	# compress
	node_modules/terser/bin/terser $AppJsBase -o $AppJs

	# check environment
	if [ "$isPro" -gt 0 ]; then
		# remove base file
		rm $AppJsBase
	fi
}

# inform
doResult()
{
	printf "\n\e[93mFind them ...\n"
	echo " > $AppCss"
	echo " > $AppJs"
}

# update library
doUpdate()
{
	# Update
	printf "\e[92m Updating ..."
	# optimize css
	npm update
	# Finish
	printf "\e[92m Finishing ..."
}

# print out third party versions
printVersion()
{
	# https://misc.flogisoft.com/bash/tip_colors_and_formatting
	echo "****** Version ***************"
	node_modules/uglifycss/uglifycss --version
	node_modules/terser/bin/terser --version
	echo "****** More information ******"
	echo "$ bash build-bundle.sh help"
	echo "****** **************** ******"
}

# check cmd
doCmd $@

# print out third party versions
printVersion

# start block
printf "\e[92mStart >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# css starting
doCss
# js starting
doJs
# output path
doResult
# end block
printf "\e[92mDone <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
