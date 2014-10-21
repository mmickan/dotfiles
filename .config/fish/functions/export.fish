function export
    set varname (echo $argv | sed 's/=.*$//')
    set -g -x $varname (echo $argv | sed 's/^.*=//' | sed 's/[: ]/\
/g')
end
