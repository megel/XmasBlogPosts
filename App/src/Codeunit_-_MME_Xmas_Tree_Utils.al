codeunit 50100 "MME Xmas Tree Utils"
{
    var
        mPosts: List of [Date];
        mCaptions: Dictionary of [Date, Text];
        mURLs: Dictionary of [Date, Text];
        mAutors: Dictionary of [Date, Text];
        mImageUrls: Dictionary of [Date, Text];

    local procedure AddBlogPost(date: Date; caption: Text; url: Text; autor: Text; imageUrl: Text)
    begin
        // each date should be added once
        if not mPosts.Contains(date) then
            mPosts.Add(date);

        // remove the entry from dictionary, if it's already present
        // and store the value 'caption' with the key 'date'
        if mCaptions.ContainsKey(date) then
            mCaptions.Remove(date);
        mCaptions.Add(date, caption);

        // store the value 'url' with the key 'date'
        if mURLs.ContainsKey(date) then
            mURLs.Remove(date);
        mURLs.Add(date, url);

        // store the value 'autor' with the key 'date'
        if mAutors.ContainsKey(date) then
            mAutors.Remove(date);
        mAutors.Add(date, autor);

        // store the value 'imageUrl' with the key 'date'
        if mImageUrls.ContainsKey(date) then
            mImageUrls.Remove(date);
        mImageUrls.Add(date, imageUrl);
    end;

    // the overloaded method (if there is no imageUrl)
    local procedure AddBlogPost(date: Date; caption: Text; url: Text; autor: Text)
    begin
        AddBlogPost(date, caption, url, autor, '');
    end;

    // Copy all Dates to another list
    procedure GetBlogDates(var dates: List of [Date])
    var
        d: Date;
    begin
        foreach d in mPosts do
            dates.Add(d);
    end;

    procedure GetCaption(date: Date): Text
    begin
        if mCaptions.ContainsKey(date) then
            exit(mCaptions.Get(date));
    end;

    procedure GetUrl(date: Date): Text
    begin
        if mURLs.ContainsKey(date) then
            exit(mURLs.Get(date));
        // Exit with the default URL
        exit('https://community.dynamics.com/business/b/financials/archive/2018/12/19/counting-down-to-the-holidays-with-daily-blogs');
    end;

    procedure GetAutor(date: Date): Text
    begin
        if mAutors.ContainsKey(date) then
            exit(mAutors.Get(date));
    end;

    procedure GetImageUrl(date: Date): Text
    begin
        if mImageUrls.ContainsKey(date) then
            exit(mImageUrls.Get(date));
        // Exit with the default URL
        exit('https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/279461_5F00_MS2018_5F00_blog_5F00_21.gif');
    end;

    procedure InitPosts()
    begin
        // All Blog Posts are listed here:
        // https://community.dynamics.com/business/b/financials/archive/2018/12/19/counting-down-to-the-holidays-with-daily-blogs

        AddBlogPost(DMY2Date(01, 12, 2018),
            'Year-end closing',
            'https://community.dynamics.com/business/b/financials/archive/2018/11/30/year-end-closing',
            'Jannik Bausager',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278424_5F00_MS2018_5F00_blog_5F00_01.gif');
        AddBlogPost(DMY2Date(02, 12, 2018),
            'How to connect to your Business Central Docker sandbox database with SQL Server Management Studio or Visual Studio Code',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/01/how-to-connect-to-your-business-central-docker-sandbox-database-with-sql-server-management-studio-or-visual-studio-code',
            'Kennie Nybo Pontoppidan',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278491_5F00_MS2018_5F00_blog_5F00_02.gif');
        AddBlogPost(DMY2Date(03, 12, 2018),
            'Seek and you shall (most likely) find: Search timeout',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/02/seek-and-you-shall-most-likely-find-search-timeout',
            'Jens Møller-Pedersen',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278603_5F00_MS2018_5F00_blog_5F00_03.gif');
        AddBlogPost(DMY2Date(04, 12, 2018),
            'The break-up',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/04/the-break-up',
            'Steffen Balslev',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278743_5F00_MS2018_5F00_blog_5F00_04.gif');
        AddBlogPost(DMY2Date(05, 12, 2018),
            'Find the right resources and provide feedback',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/04/find-the-right-resources-and-provide-feedback',
            'Fredrik Hietala',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278775_5F00_MS2018_5F00_blog_5F00_05.gif');
        AddBlogPost(DMY2Date(06, 12, 2018),
            'Security hardening your on-premises installation of NAV/Business Central',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/05/security-hardening-your-on-prem-installation-of-nav-business-central',
            'Jonathan Davis',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278805_5F00_MS2018_5F00_blog_5F00_06.gif');
        AddBlogPost(DMY2Date(07, 12, 2018),
            'Managing Your Business Central Client Environments',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/06/managing-your-business-central-client-environments',
            'Jared Hall',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278401_5F00_MS2018_5F00_blog_5F00_07.gif');
        AddBlogPost(DMY2Date(08, 12, 2018),
            'Managing screen space in Business Central',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/07/managing-screen-space-in-business-central',
            'Jacob Winther',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278906_5F00_MS2018_5F00_blog_5F00_08.gif');
        AddBlogPost(DMY2Date(09, 12, 2018),
            'Productivity just went through the roof!',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/08/productivity-just-went-through-the-roof',
            'Mike Borg Cardona',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278612_5F00_MS2018_5F00_blog_5F00_09.gif');
        AddBlogPost(DMY2Date(10, 12, 2018),
            'Monitoring and observability in the era of the cloud',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/09/monitoring-and-observability-in-the-era-of-the-cloud-what-do-we-do-in-business-central-to-keep-things-running',
            'Agustin Leyenda',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278736_5F00_MS2018_5F00_blog_5F00_10.gif');

        AddBlogPost(DMY2Date(11, 12, 2018),
            'Extending and customizing the Help',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/11/extending-and-customizing-help',
            'Eva Dupont',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278041_5F00_MS2018_5F00_blog_5F00_11.gif');
        AddBlogPost(DMY2Date(12, 12, 2018),
            'Webhooks - don''t call us, we will call you',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/12/webhooks-don-39-t-call-us-we-will-call-you',
            'Henrik Westergaard Hansen',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278591_5F00_MS2018_5F00_blog_5F00_12.gif');
        AddBlogPost(DMY2Date(13, 12, 2018),
            'Migrating code customizations to apps with the help of Docker',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/13/migrating-code-customizations-to-apps-with-the-help-of-docker',
            'Jesper Schulz',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278541_5F00_MS2018_5F00_blog_5F00_13.gif');
        AddBlogPost(DMY2Date(14, 12, 2018),
            'Intelligent Cloud Insights',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/13/intelligent-cloud-insights',
            'Brian Meier',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278607_5F00_MS2018_5F00_blog_5F00_14.gif');
        AddBlogPost(DMY2Date(15, 12, 2018),
            'Collaborate on content for Business Central',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/15/collaborate-on-content-for-business-central',
            'Eva Dupont',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278322_5F00_MS2018_5F00_blog_5F00_15.gif');
        AddBlogPost(DMY2Date(16, 12, 2018),
            'Extending the Business Inbox in Outlook - (Part 1) Creating a Custom Add-in',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/15/extending-the-business-inbox-in-outlook-part-1-creating-a-custom-add-in',
            'Jared Hall',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278317_5F00_MS2018_5F00_blog_5F00_16.gif');
        AddBlogPost(DMY2Date(17, 12, 2018),
            'Extending the Business Inbox in Outlook - (Part 2) Customizing the Add-in',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/16/extending-the-business-inbox-in-outlook-part-2-customizing-the-add-in',
            'Jared Hall',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278318_5F00_MS2018_5F00_blog_5F00_17.gif');
        AddBlogPost(DMY2Date(18, 12, 2018),
            'Microsoft Dynamics GP Data Migration Extension for Business Central',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/17/microsoft-dynamics-gp-data-migration-extension-for-business-central',
            'Jennifer Ranz',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278602_5F00_MS2018_5F00_blog_5F00_18.gif');
        AddBlogPost(DMY2Date(19, 12, 2018),
            'List your partner services on AppSource',
            'https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/18/list-your-partner-services-on-appsource',
            'Joost Bulsink',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/278417_5F00_MS2018_5F00_blog_5F00_19.gif');
        AddBlogPost(DMY2Date(20, 12, 2018),
            'How to use Business Central when on the road (just like Santa)',
            'https://community.dynamics.com/business/b/financials/archive/2018/12/19/how-to-use-business-central-when-on-the-road-just-like-santa',
            'Blazej Kotelko',
            'https://community.dynamics.com/cfs-filesystemfile/__key/msdenhancedbloggingcfs/FeaturedImages/279266_5F00_MS2018_5F00_blog_5F00_20.gif');

        // Feel free to finish unitl Xmas :)
        AddBlogPost(DMY2Date(21, 12, 2018),
            '',
            '',
            '');
        AddBlogPost(DMY2Date(22, 12, 2018),
            '',
            '',
            '');
        AddBlogPost(DMY2Date(23, 12, 2018),
            '',
            '',
            '');
        AddBlogPost(DMY2Date(24, 12, 2018),
            '',
            '',
            '');
    end;
}