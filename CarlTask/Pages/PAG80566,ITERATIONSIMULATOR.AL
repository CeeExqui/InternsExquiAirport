page 80566 "Simulator"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = Integer;
    SourceTableTemporary = true;
    Caption = 'Iteration Simulator';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {

            group(Input)
            {

                field(UserInput; UserInput)
                {
                    ApplicationArea = All;
                    Caption = 'Enter comma separated words';

                }
            }

            group(Controls)
            {
                Caption = 'Control Buttons';

                usercontrol(IterationControls; "IterationSimulatorControl")
                {
                    ApplicationArea = All;

                    trigger ControlReady()
                    begin
                        UpdateButtonStates();
                    end;

                    trigger ButtonClicked(ButtonType: Text)
                    begin
                        case ButtonType of
                            'start':
                                begin
                                    Words := UserInput.Split(',');
                                    IterIndex := 0;
                                    Counter := 0;
                                    CurrentValue := '';
                                    CurrPage.Update();
                                end;
                            'next':
                                begin
                                    NextIteration();
                                    CurrPage.Update();
                                end;
                            'skip':
                                begin
                                    if IterIndex >= 0 then begin
                                        if (IterIndex + 1) <= Words.Count then begin
                                            Message('SKIP: Ignored next item %1.', Words.Get(IterIndex + 1));
                                            IterIndex += 2;
                                            if IterIndex <= Words.Count then begin
                                                if IterIndex > 0 then
                                                    ShowCurrent();
                                            end else begin
                                                Message('End of list');
                                                ClearIteration();
                                            end;
                                        end else begin
                                            Message('No next item to skip.');
                                        end;
                                    end;
                                    CurrPage.Update();
                                end;
                            'repeat':
                                begin
                                    Counter += 1;
                                    if IterIndex = 0 then
                                        CurrentValue := 'Repeat Empty Iteration'
                                    else
                                        CurrentValue := StrSubstNo('Repeat Iteration %1', IterIndex);
                                    CurrPage.Update();
                                end;
                            'break':
                                begin
                                    Message('BREAK: Stops the loop immediately, jumps out of it.');
                                    Counter += 1;
                                    CurrentValue := StrSubstNo('Loop stopped at iteration %1', IterIndex);
                                    ClearIteration();
                                    CurrPage.Update();
                                end;
                            'exit':
                                begin
                                    Message('EXIT: Exits the current procedure.');
                                    Counter += 1;
                                    CurrentValue := 'Procedure exited';
                                    ClearIteration();
                                    CurrPage.Update();
                                end;
                            'quit':
                                begin
                                    Message('QUIT: Ends the iteration and closes the page.');
                                    CurrPage.Close();
                                end;
                        end;
                        UpdateButtonStates();
                    end;
                }
            }

            group(Output)
            {
                Caption = 'Results';

                field(Iteration; IterIndex)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Counter; Counter)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Value; CurrentValue)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group(CustomerLedgerSorting)
            {
                Caption = 'Customer Ledger Entry Sorting & Filtering';

                field(SelectedSortField; SelectedSortField)
                {
                    ApplicationArea = All;
                    Caption = 'Sort Field';
                    OptionCaption = 'Entry No.,Customer No.,Posting Date,Document No.,Due Date,External Document No.,TEST';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(FilterValue; FilterValue)
                {
                    ApplicationArea = All;
                    Caption = 'Filter Value';
                    ShowMandatory = (SelectedSortField = SelectedSortField::"Posting Date") or (SelectedSortField = SelectedSortField::"Due Date");

                    trigger OnValidate()
                    begin
                        ValidateFilterValue();
                        CurrPage.Update();
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        if SelectedSortField in [SelectedSortField::"Posting Date", SelectedSortField::"Due Date"] then
                            exit(false);

                        exit(LookupFilterValue(Text));
                    end;
                }

                usercontrol(CustomerLedgerButton; "CTRLADDINTEST")
                {
                    ApplicationArea = All;

                    trigger Notify(EventData: Text)
                    begin
                        case EventData of
                            'openPage':
                                begin
                                    CLESorted();
                                end;
                        end;
                    end;
                }
            }
        }
    }

    var
        UserInput: Text[250];
        Words: List of [Text];
        IterIndex: Integer;
        Counter: Integer;
        CurrentValue: Text[250];
        SelectedSortField: Option "Entry No.","Customer No.","Posting Date","Document No.","Due Date","External Document No.","TEST";
        FilterValue: Text[250];
        SortFieldInfo: Text[100];
        OpenSortedPageButtonText: Text;

    trigger OnOpenPage()
    begin
        OpenSortedPageButtonText := 'Open Sorted Customer Ledger';
    end;

    local procedure InitializeCurrent()
    begin
        if (IterIndex > 0) and (IterIndex <= Words.Count) then begin
            CurrentValue := DelChr(Words.Get(IterIndex), '<>', ' ');
        end else begin
            Message('No items to process.');
            ClearIteration();
        end;
    end;

    local procedure ShowCurrent()
    begin
        if (IterIndex > 0) and (IterIndex <= Words.Count) then begin
            Counter += 1;
            CurrentValue := DelChr(Words.Get(IterIndex), '<>', ' ');
        end else begin
            Message('No more iterations.');
            ClearIteration();
        end;
    end;
    /*
        This procedure advances to the next iteration in the list of words.
        It updates the current value and handles the end of the list by clearing the iteration state.
    */
    local procedure NextIteration()
    begin
        if IterIndex >= 0 then begin
            IterIndex += 1; // Move to next iteration
            if IterIndex <= Words.Count then begin
                ShowCurrent(); // Process the current item
            end else begin
                Message('Iteration finished.');
                ClearIteration();
            end;
        end;
    end;
    /*
        This procedure clears the current iteration state, resetting the index, current value, and word list.
    */
    local procedure ClearIteration()
    begin
        IterIndex := 0;
        Clear(CurrentValue);
        Clear(Words);
    end;
    /*
       This Procedure sorts and filters the "Cust. Ledger Entry" records based on the selected field and filter value.
        It then opens the "Customer Ledger Entries" page to display the sorted and filtered records.
        and the filter is applied only if there is a filter value Available.
    */
    local procedure CLESorted()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Reset();

        case SelectedSortField of
            SelectedSortField::"Entry No.":
                begin
                    CustLedgerEntry.SetCurrentKey("Entry No.");
                    CustLedgerEntry.SetAscending("Entry No.", true);
                end;
            SelectedSortField::"Customer No.":
                begin
                    CustLedgerEntry.SetCurrentKey("Customer No.");
                    CustLedgerEntry.SetAscending("Customer No.", true);
                end;
            SelectedSortField::"Posting Date":
                begin
                    CustLedgerEntry.SetCurrentKey("Posting Date");
                    CustLedgerEntry.SetAscending("Posting Date", true);
                end;
            SelectedSortField::"Document No.":
                begin
                    CustLedgerEntry.SetCurrentKey("Document No.");
                    CustLedgerEntry.SetAscending("Document No.", true);
                end;
            SelectedSortField::"Due Date":
                begin
                    CustLedgerEntry.SetCurrentKey("Due Date");
                    CustLedgerEntry.SetAscending("Due Date", true);
                end;
            SelectedSortField::"External Document No.":
                begin
                    CustLedgerEntry.SetCurrentKey("External Document No.");
                    CustLedgerEntry.SetAscending("External Document No.", true);
                end;
            SelectedSortField::TEST:
                begin
                    CustLedgerEntry.SetCurrentKey("Entry No.");
                    CustLedgerEntry.SetAscending("Entry No.", true);
                end;
        end;

        if FilterValue <> '' then begin
            case SelectedSortField of
                SelectedSortField::"Entry No.":
                    CustLedgerEntry.SetFilter("Entry No.", FilterValue);
                SelectedSortField::"Customer No.":
                    CustLedgerEntry.SetFilter("Customer No.", FilterValue);
                SelectedSortField::"Posting Date":
                    CustLedgerEntry.SetFilter("Posting Date", FilterValue);
                SelectedSortField::"Document No.":
                    CustLedgerEntry.SetFilter("Document No.", FilterValue);
                SelectedSortField::"Due Date":
                    CustLedgerEntry.SetFilter("Due Date", FilterValue);
                SelectedSortField::"External Document No.":
                    CustLedgerEntry.SetFilter("External Document No.", FilterValue);
                SelectedSortField::TEST:
                    CustLedgerEntry.SetFilter("Entry No.", FilterValue);
            end;
        end;

        Page.Run(Page::"Custom Customer Ledger Entries", CustLedgerEntry);
    end;
    /*
        This procedure updates the states of the control buttons based on the current iteration state.
        It enables or disables buttons and sets their visual states (e.g., active, highlight) accordingly.
    */
    local procedure UpdateButtonStates()
    var
        ButtonStates: Text;
        EnabledButtons: Text;
    begin
        if (IterIndex = 0) and (Words.Count = 0) then begin
            EnabledButtons := '["start"]';
            ButtonStates := '{"start":"highlight"}';
        end else if (IterIndex = 0) and (Words.Count > 0) then begin
            EnabledButtons := '["next","skip","repeat","break","exit","quit"]';
            ButtonStates := '{"next":"active"}';
        end else begin
            EnabledButtons := '["next","skip","repeat","break","exit","quit"]';
            ButtonStates := '{"next":"active"}';
        end;
        CurrPage.IterationControls.EnableButtons(EnabledButtons);
        CurrPage.IterationControls.SetButtonStates(ButtonStates);
    end;

    /*
        This procedure handles the lookup functionality for the FilterValue field.
        It opens appropriate pages based on the selected sort field to allow users to select values.
        Lookup is disabled for date fields (Posting Date and Due Date) to ensure proper date format.
    */
    local procedure LookupFilterValue(var Text: Text): Boolean
    var
        Customer: Record Customer;
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        if SelectedSortField in [SelectedSortField::"Posting Date", SelectedSortField::"Due Date"] then
            exit(false);

        case SelectedSortField of
            SelectedSortField::"Customer No.":
                begin
                    if Page.RunModal(Page::"Customer List", Customer) = Action::LookupOK then begin
                        Text := Customer."No.";
                        FilterValue := Text;
                        exit(true);
                    end;
                end;
            else begin
                if Page.RunModal(Page::"Customer Ledger Entries", CustLedgerEntry) = Action::LookupOK then begin
                    case SelectedSortField of
                        SelectedSortField::"Entry No.":
                            Text := Format(CustLedgerEntry."Entry No.");
                        SelectedSortField::"Document No.":
                            Text := CustLedgerEntry."Document No.";
                        SelectedSortField::"External Document No.":
                            Text := CustLedgerEntry."External Document No.";
                        SelectedSortField::TEST:
                            Text := Format(CustLedgerEntry."Entry No.");
                    end;
                    FilterValue := Text;
                    exit(true);
                end;
            end;
        end;
        exit(false);
    end;
    /*
    This procedure validates the FilterValue based on the selected sort field.
    It ensures that date fields (Posting Date and Due Date) have valid date formats or date ranges.
    */
    local procedure ValidateFilterValue()
    var
        TestDate: Date;
    begin
        // Validate date format for date fields
        if SelectedSortField in [SelectedSortField::"Posting Date", SelectedSortField::"Due Date"] then begin
            if FilterValue <> '' then begin
                // Try to parse as date to validate format
                if not Evaluate(TestDate, FilterValue) then begin
                    // Check if it's a date range (contains ..)
                    if not (StrPos(FilterValue, '..') > 0) then begin
                        Error('Invalid date format. Please enter a valid date (e.g., 01/01/2024) or date range (e.g., 01/01/2024..31/12/2024).');
                    end;
                end;
            end;
        end;
    end;
}