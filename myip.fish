function myip
    echo "WAN IP:" (curl -s ipv4.icanhazip.com)
    set local_ips (ip a | awk '/inet / && !/127.0.0.1/ {print $NF ": " $2}' | cut -d/ -f1)
    if test -n "$local_ips"
        echo $local_ips
    else
        echo "No local IP addresses found"
    end
end
