page 50101 "MME Xmas Control Factbox"
{
    PageType = CardPart;
    Caption = 'Xmas Blog Post';

    layout
    {
        area(Content)
        {
            usercontrol(XmasTree; "MME Xmas Control")
            {
                ApplicationArea = All;
                trigger OnInitialized()
                begin
                    mInitialized := true;
                    SetUrl(mUrl, mImageName);
                end;
            }
        }
    }

    var
        mInitialized: Boolean;
        mUrl: Text;
        mImageName: Text;

    procedure SetUrl(url: Text; imageName: Text)
    begin
        mUrl := url;
        mImageName := imageName;
        if mInitialized then
            CurrPage.XmasTree.SetUrl(mUrl, mImageName);
    end;

    procedure OpenUrl(url: Text)
    begin
        if mInitialized then
            CurrPage.XmasTree.OpenUrl(mUrl);
    end;
}