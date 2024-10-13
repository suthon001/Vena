/// <summary>
/// PageExtension VENA Sales Receipt Card (ID 82006) extends Record YVS Sales Receipt Card.
/// </summary>
pageextension 82006 "VENA Sales Receipt Card" extends "YVS Sales Receipt Card"
{
    layout
    {
        addafter("Cheque No.")
        {
            field("VENA Cheque Bank Name"; rec."VENA Cheque Bank Name")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Cheque Bank Name field.';
            }
            field("VENA Cheque Bank Branch"; rec."VENA Cheque Bank Branch")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Cheque Bank Branch field.';
            }
        }
    }
    actions
    {
        addafter("Sales Receipt")
        {
            action("VENASales Receipt")
            {
                Caption = 'Sales Receipt';
                Image = PrintReport;
                ApplicationArea = all;
                PromotedCategory = Report;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Sales Receipt action.';
                trigger OnAction()
                var

                    BillingReceiptHeader: Record "YVS Billing Receipt Header";
                begin
                    BillingReceiptHeader.reset();
                    BillingReceiptHeader.SetRange("Document Type", rec."Document Type");
                    BillingReceiptHeader.SetRange("No.", rec."No.");
                    REPORT.RunModal(REPORT::"VENA Sales Receipt", true, true, BillingReceiptHeader);
                end;
            }
        }
        modify("Sales Receipt")
        {
            Visible = false;
        }
    }
}

