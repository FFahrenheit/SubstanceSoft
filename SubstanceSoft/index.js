document.addEventListener('DOMContentLoaded', function()
{
    fetch("configuration.json")
    .then(function (resp) {
        return resp.json();
    })
    .then(function (data) {
        console.log(data);
        if(!data.set)
        {
            console.log("Not set yet"); 
            window.location.pathname = 'setup.html'
        }
        else 
        {
            if(data.type=='central')
            {
                console.log('Aún no soportado xd');
                var path = 'http://'+data.IP+'/substancesoft/views/menus/index.php';
                window.location.href = path; 
            }
            else 
            {
                var path = 'http://'+data.IP+'/substancesoft/views/menus/index.php';
                window.location.href = path; 
            }
        }
    });
}, false);