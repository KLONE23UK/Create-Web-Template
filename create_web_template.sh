#!/usr/bin/bash

# create_web_template
# By; Ryan Gilluley

runner=true
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
        echo 'Select a template from the list below (1/2/3...)
    1. Blank
    2. Simple
    3. Delux'
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
                3)
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
    template $projectName
}

makeFiles () {
    # Make Folders
    mkdir "$projectName" "$projectName/css" "$projectName/img" "$projectName/js"

    # Make files
    touch "$projectName/css/style.css" "$projectName/js/index.js" "$projectName/index.htm"

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
            cat > "$projectName/css/style.css" << EOF
html {
    padding:0px;
}
body {
    margin: 0px;
}
EOF
        ;;
        3)
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
    <nav class="navbar navbar-dark bg-dark" id="nav">
        <div class="col-1">
            <a class="navbar-brand cecnter d-flex justify-content-end" href="#">
                $projectName
            </a>
        </div>
        <div class="col-11">
        <ul id="navLinks">
            <li>
                <a href="#">
                    Home
                </a>
            </li>
            <li>
                <a href="#">
                    Link 2
                </a>
            </li>
            <li>
                <a href="#">
                    Link 3
                </a>
            </li>
        </ul>
    </nav>
    <div class="container-fluid ">
        <div class="row">
            <div class="col-12 text-center" id="head">
                <h1 id="main-title">Delux Template</h1>
            </div>
            <div class="col-12" id="main-content">
                <div class="section">
                    <h3 class="subtitle">Sub Title</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque enim elit, suscipit et quam non, pharetra vulputate lacus. Sed at interdum magna. Donec suscipit erat augue, sit amet dictum ipsum mattis sed. Ut dignissim odio ante, at faucibus ex rhoncus a. Fusce condimentum ipsum neque, nec consequat eros feugiat et. Proin purus diam, maximus ac felis in, tempor laoreet metus. Maecenas tempor magna sit amet tortor mattis rutrum. Aenean fermentum tincidunt ipsum. Maecenas est libero, ultrices nec tempus ut, commodo in est. Sed tincidunt dui tellus, vitae fermentum nisl placerat eu. Morbi euismod ipsum ac malesuada imperdiet. Etiam vulputate mauris lacus, bibendum sollicitudin mi blandit sit amet. Morbi congue mi dui, eu ullamcorper purus dignissim sed.</p>
                </div>
                <div class="section">
                    <h3 class="subtitle">Sub Title</h3>
                    <p>Pellentesque sodales enim ut arcu laoreet, ac aliquet nulla efficitur. Curabitur condimentum nisl turpis, et rhoncus nunc ullamcorper a. Aenean scelerisque elementum convallis. Nullam imperdiet tellus a finibus aliquet. Sed sit amet lacus id augue faucibus blandit. Curabitur varius magna ac placerat mattis. Suspendisse potenti.</p>
                    <p>Vivamus et faucibus enim. Pellentesque consectetur dui nunc, nec pulvinar quam molestie eu. Donec imperdiet vulputate mattis. Pellentesque ut posuere justo. Etiam congue arcu ut tellus facilisis, non porta ligula fermentum. Suspendisse eu lectus vitae velit sodales maximus nec vel lacus. In tristique at dui sed posuere.</p>
                </div>
                <div class="section">
                    <h3 class="subtitle">Sub Title</h3>
                    <p>Proin tempus commodo tortor, eu dictum massa ultricies sit amet. Phasellus egestas, risus quis sodales consequat, urna sem euismod nunc, ac blandit nisl erat vitae lectus. Pellentesque sit amet diam diam. Aliquam eu rhoncus augue. Proin malesuada nec augue sagittis commodo. Aliquam viverra pretium ligula, id blandit turpis dignissim et. Praesent ut gravida odio. Ut velit sapien, scelerisque eu malesuada vestibulum, condimentum nec tellus. Sed nulla massa, rhoncus ultrices tellus eu, malesuada egestas est. Curabitur at lorem id nisi gravida efficitur. Aliquam consequat consectetur efficitur. Vivamus interdum, ante eget vulputate vulputate, sem mauris accumsan eros, quis tristique turpis justo a dolor. Maecenas tortor enim, egestas non est at, scelerisque lacinia mauris.</p>
                    <p>Vivamus et faucibus enim. Pellentesque consectetur dui nunc, nec pulvinar quam molestie eu. Donec imperdiet vulputate mattis. Pellentesque ut posuere justo. Etiam congue arcu ut tellus facilisis, non porta ligula fermentum. Suspendisse eu lectus vitae velit sodales maximus nec vel lacus. In tristique at dui sed posuere.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                <li class="nav-item">
                    <a href="#" class="nav-link px-2 text-muted">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2 text-muted">
                        Link 2
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2 text-muted">
                        Link 3
                    </a>
                </li>
            </ul>
            <p class="text-center">
                $projectName
            </p>
        </footer>
    </div>
    <script src="/js/index.js"></script>
    ${bootstrap[bootstrapJS]}
    ${bootstrap[bootstrapJQ]}
</body>
</html>
EOF
            cat > "$projectName/css/style.css" << EOF
html {
    padding:0px;
    font-family: Arial, Helvetica, sans-serif;
}
body {
    margin: 0px;
}
#nav {
    color:white;
}
#navLinks li {
    display: inline-block;
    margin-top: 15px;
    padding-left: 25px;
    padding-right: 25px;
}
#navLinks a {
    text-decoration: none;
    color: rgb(202, 202, 202);
}
#navLinks a:hover {
    text-decoration: none;
    color: rgb(255, 255, 255);
}
#head {
    padding: 80px;
    background: linear-gradient(190deg, #ffbb00,#eaf201 );
}
#main-title {
    background: linear-gradient(90deg, rgb(0, 60, 255), rgb(45, 215, 253));
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
#main-content {
    color: white;
    padding: 45px 55px 0px 55px;
    background-color: rgb(51, 51, 51);
    text-align: justify;
}
.section {
    margin-bottom: 40px;
}
EOF
        ;;

    esac

    displayOutput
}

displayOutput() {
    echo -e "\nDirectories and files created;"
    structure=`find "$projectName"`
    echo -e "${blue}$structure${endColour}"
}

helptext () {
    echo '
create_web_template

USAGE: ./create_web_template -[ OPTION ] VALUE

OPTIONS:
    -n      Set the project Name. Use "" for multi word name. i.e. ./create_web_template -n "Project 1"
    -t      Set the template for files. 
        1   Blank
        2   Simple
        3   Delux
    -h      Show this help message.

EXAMPLES:
    ./create_web_template -n Project1

    ./create_web_template -n "2nd Project" 

    ./create_web_template -n "Third Project" -t 3
'
}

while getopts "n:t:h" options; do
    case "${options}" in
        n )
            projectName="${OPTARG}"
        ;;
        t )
            template="${OPTARG}"
        ;;
        h )
            runner=false
            helptext
        ;;
        : )
            echo -e "*Cannot set option: ${OPTARG} : Starting normally without options.*\n"
        ;;
        * )
            echo -e "*invalid command: ${OPTARG} : Starting normally without options.*\n"
    esac
done
runProgram() {
    if [[ $runner = true ]]; then
        echo -e $banner

        if [[ $projectName = "" ]]; then
            setup
        else
            template $projectName
        fi
    fi
}

runProgram
