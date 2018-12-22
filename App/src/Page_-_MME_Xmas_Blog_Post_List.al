page 50100 "MME Xmas Blog Post List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Xmas Blog Posts';
    SourceTable = "Date Lookup Buffer";
    SourceTableTemporary = true;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; mDate)
                {
                    ApplicationArea = All;
                }
                field(Autor; mAutor)
                {
                    ApplicationArea = All;
                }
                field(Caption; mCaption)
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    begin
                        CurrPage."MME Xmas Control PagePart".Page.OpenUrl(mURL);
                    end;
                }
            }
        }
        area(Factboxes)
        {

            part("MME Xmas Control PagePart"; "MME Xmas Control Factbox")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(OpenBlogPost)
            {
                Caption = 'Open Blog Post';
                Image = Web;
                Promoted = true;

                PromotedIsBig = true;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    if rec.IsEmpty() then
                        CurrPage."MME Xmas Control PagePart".Page.OpenUrl(mXmasUtils.GetUrl(Today()))
                    else
                        CurrPage."MME Xmas Control PagePart".Page.OpenUrl(mXmasUtils.GetUrl(rec."Period Start"));
                end;
            }
        }
    }

    var
        mXmasUtils: Codeunit "MME Xmas Tree Utils";
        mDate: Date;
        mURL: Text;
        mAutor: Text;
        mCaption: Text;
        mImageUrl: Text;

        mDefaultUrl: Text;


    trigger OnInit()
    var
        day: Date;
        dates: List of [Date];
    begin
        mXmasUtils.InitPosts();

        mXmasUtils.GetBlogDates(dates);
        foreach day in dates do begin
            Rec.Init();
            Rec."Period Start" := day;
            Rec.Insert();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        mDate := rec."Period Start";
        mCaption := mXmasUtils.GetCaption(mDate);
        mURL := mXmasUtils.GetUrl(mDate);
        mAutor := mXmasUtils.GetAutor(mDate);
        mImageUrl := mXmasUtils.GetImageUrl(mDate);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."MME Xmas Control PagePart".Page.SetUrl(mUrl, mImageUrl);
    end;
}