function SetUrl(url, imageUri)
{
    var controlAddIn = document.getElementById('controlAddIn');
    if (! controlAddIn) {
        console.error('controlAddIn not found!')
        return;
    }

    if (! url || url === "") {
        // Default URL for Blog Posts
        url = "https://community.dynamics.com/business/b/financials/archive/2018/12/19/counting-down-to-the-holidays-with-daily-blogs"
    }

    if (! imageUri || imageUri === "") {
        imageUri = "https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/279461_5F00_MS2018_5F00_blog_5F00_21.gif"
    }

    controlAddIn.innerHTML = '<div><a href="' + url + '" target="_blank">'
          + '<img id="blogPostImage" src="' + imageUri + '"></ image>'
          + '</a></div>';
}

function OpenUrl(url)
{
    if (! url || url === "") {
        // Default URL for Blog Posts
        url = "https://community.dynamics.com/business/b/financials/archive/2018/12/19/counting-down-to-the-holidays-with-daily-blogs"
    }

    try {
        window.open(url);
    } catch (error) { console.error(error); }
}