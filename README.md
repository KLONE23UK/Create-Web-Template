# create_web_template
### Created By; Ryan Gilluley

## Section
- [Description](#description)
- [Screenshots](#screenshots)
- [Usage](#usage)
    - [Flags](#flags)
- [Future Plans](#future-plans)


## Description

Simple script to create file and directory template structure for static front end web development with bootstrap CDN included.

You can select between three different templates
1. Blank
2. Basic
3. Delux

The Script will generate the files and directorys based on the project name and template specified.

Good for practicing, testing or just getting a head start.


## Screenshots

Running the script without any options.
![alt text](https://eapi.pcloud.com/getpubthumb?code=XZQoKmZF609zyssKX8ran6qz0dGH0n4v1X7&linkpassword=undefined&size=1447x782&crop=0&type=auto)

Running the script with the 'n' flag to set the project name and 't' flag to set the template.
![alt text](https://eapi.pcloud.com/getpubthumb?code=XZgoKmZPU7cPa41nrLPJVN9mJHBnRCnlvN7&linkpassword=undefined&size=1711x577&crop=0&type=auto)

The script will ask if a directory with the same project name already exists and if you would like to overwrite it.
![alt text](https://eapi.pcloud.com/getpubthumb?code=XZwoKmZeoS2kFY8hr4jxQDm8lYhl7bELSy0&linkpassword=undefined&size=1612x704&crop=0&type=auto)

Example of Web Template 3 - Delux
![alt text](https://eapi.pcloud.com/getpubthumb?code=XZCQRSZIQvzHM71fQzPwU68fFPRJY05CBzV&linkpassword=undefined&size=1536x780&crop=0&type=auto)


## Usage

Run the script after giving execute permissions.
```
chmod +x create_web_template.sh
./create_web_template.sh
```


### Flags

```OPTIONS:
    -n      Set the project Name. Use "" for multi word name. i.e. ./create_web_template -n "Project 1"
    -t      Set the template for files.
            1   Blank
            2   Simple
            3   Delux
    -h      Show this help message.
```


### Examples

You can use the 'n' flag to set the name of the project.
```
./create_web_template.sh -n Project1
```
Use quatation marks for multi word projects
```
./create_web_template.sh -n "Web Project 1"
```
You can use the 't' flag to set the template that you would like to use.
```
./create_web_template.sh -n Project1 -t 1
```

Best way to use this script is to make an alias for it so you can run it where ever you like.
Add the line to your .bashrc and point it to where the script is located.
Navigate to the folder you want to generate the project files.
```
alias wt="~/create_web_template.sh"
```
```
wt -n Project1 -t 1
```


## Future Plans

- Add options to setup
    - Allow choice of weather to add bootstrap CDN or not
    - Add different file and directory structures
- ~~Add Delux template~~
