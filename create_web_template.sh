# create_web_template
# By; Ryan Gilluley

echo "What will this project be called?"
read projectName

# Make Folders
mkdir $projectName
mkdir $projectName/css
mkdir $projectName/img
mkdir $projectName/js

# Make files
touch $projectName/css/style.css
touch $projectName/js/index.js
touch $projectName/index.htm

# Add boilerplate to HTML file
cat > $projectName/index.htm << EOF

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>$projectName</title>
</head>
<body>
    <script src="/js/index.js"></script>
</body>
</html>
EOF

echo "Done!"
