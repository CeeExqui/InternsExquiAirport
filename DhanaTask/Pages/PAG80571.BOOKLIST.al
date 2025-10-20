page 80571 "Book List"
{
    PageType = List;
    SourceTable = Books;
    ApplicationArea = All;
    Caption = 'Books';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Book No."; Rec."Book ID") { ApplicationArea = All; }
                field("Book Description"; Rec."Book Description") { ApplicationArea = All; }
                field("Book Author"; Rec."Author") { ApplicationArea = All; }
                field("Book Publish Date"; Rec."Published Date") { ApplicationArea = All; }
                field("Title"; Rec."Title") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportBooksTxt)
            {
                Caption = 'Import Books (TXT)';
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Select Books .txt', '', 'Text file (*.txt)|*.txt', FileName, InS) then
                        XMLPORT.Import(XMLPORT::"Books Import (TXT)", InS);
                end;
            }

            action(ExportBooksTxt)
            {
                Caption = 'Export Books (TXT)';
                Image = Export;
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutS);
                    XMLPORT.Export(XMLPORT::"Books Export (TXT)", OutS);
                    TempBlob.CreateInStream(InS);
                    DownloadFromStream(InS, 'Export Books', '', 'Text file (*.txt)|*.txt', FileName);
                end;
            }
        }
    }
}
