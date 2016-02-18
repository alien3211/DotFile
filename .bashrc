export PATH="/vobs/rnc/artfw/tools/art/bin:${PATH}"
export WCDMASTE_ROOT=/proj/rnckidc/wcdmaroot_rnc_xft
alias tmux='tmux -2'
_3gsim(){
    local cur prev opts base
    
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}" 
    
    #
    #  The basic options we'll complete.
    #
    opts="console create list ls"
    
    #
    #  Complete the arguments to some of the basic commands.
    #
    case "${prev}" in
        ls)
            local ls=$(ls -1)
            COMPREPLY=( $(compgen -W "${ls}" -- ${cur}) )
            return 0
        ;;
        console)
            local running=$(for x in `xm list --long | grep \(name | grep -v Domain-0 | awk '{ print $2 }' | tr -d \)`; do echo ${x} ; done )
            COMPREPLY=( $(compgen -W "${running}" -- ${cur}) )
            return 0
        ;;
        create)
            local names=$(for x in `ls -1 /etc/xen/*.cfg`; do echo ${x/\/etc\/xen\//} ; done )
            COMPREPLY=( $(compgen -W "${names}" -- ${cur}) )
            return 0
        ;;
        *)
        ;;
    esac
    
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))  
    
    return 0
}

# complete -F _3gsim xm

