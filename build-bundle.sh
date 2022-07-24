#!/bin/bash
# version 1.2.0
# argument command
CMD_KEY=''
CMD_VALUE=''
# command list
CMD_LIST_ENV='env'

# declare variables
RootPath=./assets/
PagePath="$RootPath"page
# name
AppCss="$RootPath"app.css
AppCssBase="$RootPath"app.base.css
AppJs="$RootPath"app.js
AppJsBase="$RootPath"app.base.js
# dir
AppJsDirPatterns=($PagePath/[0-9]_*/js/[0-9]_*.js $PagePath/[0-9]_*/js/[0-9][0-9]_*.js $PagePath/[0-9][0-9]_*/js/[0-9]_*.js $PagePath/[0-9][0-9]_*/js/[0-9][0-9]_*.js)
AppCssDirPatterns=($PagePath/[0-9]_*/css/[0-9]_*.css $PagePath/[0-9]_*/css/[0-9][0-9]_*.css $PagePath/[0-9][0-9]_*/css/[0-9]_*.css $PagePath/[0-9][0-9]_*/css/[0-9][0-9]_*.css)

# production environment
isPro=0

# enviroment
checkEnv()
{
	# find any condition
	for opt in "$@" ; do
		# get command
		CMD_KEY="${opt%=*}"
		CMD_VALUE="${opt#*=}"

		# filter environment
		if [[ ${CMD_KEY} = ${CMD_LIST_ENV} ]] ; then
			# production environment
			if [[ ${CMD_VALUE} = "pro" ]] ; then
				echo "The environment is pro"
				isPro=1
				break
			if
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
			# title as file name
			#echo "/* $FileCss */" >> $AppCssBase;
			# merge css
			cat $FileCss >> $AppCssBase;
		fi
	done

	# compress
	node_modules/uglifycss/uglifycss $AppCssBase > $AppCss

	# check environment
	if [ $isPro = 1 ]; then
		# remove base file
		rm $AppCssBase
	fi
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
			# title as file name
			#echo "// $FileJs" >> $AppJsBase;
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

# print out third party versions
printVersion()
{
	node_modules/uglifycss/uglifycss --version
	node_modules/terser/bin/terser --version
}

# check environment and apply
checkEnv $@

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
