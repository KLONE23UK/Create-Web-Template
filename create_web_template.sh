#!/usr/bin/bash

# create_web_template
# By; Ryan Gilluley

blue="\e[34m"
endColour="\e[0m"
banner="${blue}*********************************\n*${endColour}\tcreate_web_template\t${blue}*\n*********************************${endColour}\n"

setup() {
    # Setup Step
    declare -A bootstrap=( [bootstrapCSS]="<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\">" [bootstrapJS]="<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js\" integrity=\"sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V\" crossorigin=\"anonymous\"></script>" [bootstrapJQ]="<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4\" crossorigin=\"anonymous\"></script>" )

    echo -e $banner
    echo "What will this project be called?"
    read projectName

    if [ -d "$projectName" ]; then
        echo "A directory with the same name already exists. Would you like to overwrite it? (y/n)"
        read overwrite
        if [ $overwrite = 'y' ]; then
            echo "Overwriting..."
            rm -rf $projectName
            makeFiles $projectName
        else
            echo "exiting"
            exit
        fi
    else
        makeFiles $bootstrap
    fi
}

makeFiles () {
    # Make Folders
    mkdir $projectName
    mkdir $projectName/css
    mkdir $projectName/img
    mkdir $projectName/js

    # Make files
    touch $projectName/css/style.css
    touch $projectName/js/index.js
    touch $projectName/index.htm

    htmlTemplate $bootstrap
}

htmlTemplate () {
    # Add boilerplate to HTML file
    cat > $projectName/index.htm << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    ${bootstrap[bootstrapCSS]}
    <title>$projectName</title>
</head>
<body>
    <script src="/js/index.js"></script>
    ${bootstrap[bootstrapJS]}
    ${bootstrap[bootstrapJQ]}
</body>
</html>
EOF
}

setup

echo -e "\nFolder and files created;"
structure=`find $projectName`
echo -e "${blue}$structure${endColour}"
 
