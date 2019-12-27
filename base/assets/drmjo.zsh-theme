function default_aws_region {
    if [[ -n $AWS_DEFAULT_REGION ]]; then
        echo "%{$fg[cyan]%}$AWS_DEFAULT_REGION%{$reset_color%}" && return
    fi
}

function default_aws_profile {
    if [[ -n $AWS_DEFAULT_PROFILE ]]; then
        echo "%{$fg[yellow]%}$AWS_DEFAULT_PROFILE%{$reset_color%} ($(default_aws_region))" && return
    fi
}

function get_ctx {
    echo "%{$fg[green]%}$(kubectl config view -o=jsonpath='{.current-context}')%{$reset_color%}"
}

PROMPT=$'%{$fg_bold[green]%}%n@%m%{$reset_color%} %~ $(default_aws_profile) $(get_ctx)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '