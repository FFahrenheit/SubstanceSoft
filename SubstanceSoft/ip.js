var ip = document.getElementById("ip");

document.addEventListener('DOMContentLoaded', () => 
{
    var os = require('os');
    var networkInterfaces = Object.values(os.networkInterfaces())
        .reduce((r, a) => {
            r = r.concat(a)
            return r;
        }, [])
        .filter(({ family, address }) => {
            return family.toLowerCase().indexOf('v4') >= 0 &&
                address !== '127.0.0.1'
        })
        .map(({ address }) => address);
    for(var i=0; i<networkInterfaces.length; i++)
    {
        if(networkInterfaces[i] == '192.168.137.1')
        {
            networkInterfaces[i]+=' (Solo por hotspot)';
        }
    }
    var ipAddresses = networkInterfaces.join(', ')
    console.log(ipAddresses);
    ip.innerHTML = ipAddresses;
});