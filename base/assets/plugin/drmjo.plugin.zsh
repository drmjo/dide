profile (){
    export AWS_DEFAULT_PROFILE=$1
}

region (){
    export AWS_DEFAULT_REGION=$1
}

aws-defaults () {
    export AWS_DEFAULT_PROFILE=$1
    export AWS_DEFAULT_REGION=$2
}

# aliases
alias k='kubectl'