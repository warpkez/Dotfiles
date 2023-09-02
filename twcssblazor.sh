#!/bin/sh

# If creating a new Blazor project from scratch
if [ $# -gt 0 ]; then
	if [ -e "$1" ]; then
		cd "$1"
		if [ ! -e "$1".csproj ] ; then
			dotnet new blazorwasm-empty
		fi
	else
		mkdir "$1"
		cd "$1"
		dotnet new blazorwasm-empty
	fi
fi

# Does the tailwind config exist, if not install tailwindcss
if [ ! -e ./tailwind.config.js ] ; then
	npm install -D tailwindcss
	npx tailwindcss init
	sed -i "s/content: \[\],/content: \['.\/\*\*\/\*{razor,html,cshtml}'],/" ./tailwind.config.js
fi

# Create the base classes
if [ ! -e ./Styles/app.css ] ; then
	if [ ! -e ./Styles ] ; then
		mkdir ./Styles
	fi
	
	echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;\n" > ./Styles/app.css
fi

# Modify index.html to include the tailwind css
if [ -e ./wwwroot/index.html ] ; then
	cd wwwroot
	sed '/<link href="css\/app.css" rel="stylesheet" \/>/a <link href="css\/tailwind.css" rel="stylesheet" />' index.html > temp.html && mv temp.html index.html
	sed -i 's/<div id="app">/<div id="app" class="h-screen w-screen flex item-center justify-center">/g' index.html
	cd ..
fi

# Create a small shell script that starts npx
if [ ! -e ./starttwcss.sh ] ; then
	echo "npx tailwindcss -i Styles/app.css -o wwwroot/css/tailwind.css --watch" > starttwcss.sh
	chmod +x starttwcss.sh
fi