#!/usr/bin/bash

# create_web_template
# By; Ryan Gilluley

blue="\e[34m"
endColour="\e[0m"
banner="${blue}―――――――――――――――――――――――――――――――――\n|${endColour}\tcreate_web_template\t${blue}|\n―――――――――――――――――――――――――――――――――${endColour}\n"
declare -A bootstrap=( [bootstrapCSS]="<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\">" [bootstrapJS]="<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js\" integrity=\"sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V\" crossorigin=\"anonymous\"></script>" [bootstrapJQ]="<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4\" crossorigin=\"anonymous\"></script>" )

checkDirectory() {
    if [ -d "$projectName" ]; then
        echo "A directory with the same name already exists. Would you like to overwrite it? (y/n)"
        read overwrite
        if [ $overwrite = 'y' ]; then
            echo "Overwriting..."
            rm -rf $projectName
            makeFiles "$projectName" $template
        else
            echo "exiting"
            exit 1
        fi
    else
        makeFiles $bootstrap $template
    fi
}

template() {
    if [[ $template = "" ]]; then
        echo 'Select a template from the list below (1/2...)
    1. Blank
    2. Simple'
        while true; do
            read template
            case $template in
                1)
                    checkDirectory "$projectName"
                    break
                ;;
                2)
                    checkDirectory "$projectName"
                    break
                ;;
                *)
                    echo "invalid argument - please select use a number to select which template you would like to use (1,2...)"
                ;;
            esac
        done
    else
        checkDirectory $projectName
    fi
}

setup() {
    echo "What will this project be called?"
    read projectName
    echo $projectName
    template $projectName
}

makeFiles () {
    # Make Folders
    mkdir "$projectName"
    mkdir "$projectName/css"
    mkdir "$projectName/img"
    mkdir "$projectName/js"

    # Make files
    touch "$projectName/css/style.css"
    touch "$projectName/js/index.js"
    touch "$projectName/index.htm"

    htmlTemplate $bootstrap $template
}

htmlTemplate () {
    # Add boilerplate to HTML file
    case $template in
        1)
            cat > "$projectName/index.htm" << EOF
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
        ;;
        2)
            cat > "$projectName/index.htm" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    ${bootstrap[bootstrapCSS]}
    <title>$projectName</title>
</head>
<body>
    <div class="container-fluid ">
        <div class="row p-4">
            <div class="col-12 text-center" id="head">
                <h1 id="main-title">$projectName</h1>
            </div>
            <div class="col-12" id="main-content">
                <h3 class="titles">title</h3>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quibusdam minus, iure itaque molestias quaerat dignissimos laborum debitis nostrum optio laudantium, expedita aperiam reprehenderit ex ut quas voluptas aut dicta laboriosam.</p>
            </div>
        </div>
    </div>
    <script src="/js/index.js"></script>
    ${bootstrap[bootstrapJS]}
    ${bootstrap[bootstrapJQ]}
</body>
</html>
EOF
            cat > $projectName/css/style.css << EOF
html {
    padding:0px;
}
body {
    margin: 0px;
}
EOF
        ;;

    esac
}

echo -e $banner

while getopts "n:t:" options; do
    case "${options}" in
        n )
            projectName="${OPTARG}"
        ;;
        t )
            template="${OPTARG}"
        ;;
        : )
            echo -e "*Cannot set option: ${OPTARG} : Starting normally without options.*\n"
        ;;
        * )
            echo -e "*invalid command: ${OPTARG} : Starting normally without options.*\n"
    esac
done

if [[ $projectName = "" ]]; then
    setup
else
    template $projectName
fi


echo -e "\nDirectories and files created;"
structure=`find "$projectName"`
echo -e "${blue}$structure${endColour}"
