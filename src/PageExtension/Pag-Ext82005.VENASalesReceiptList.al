/// <summary>
/// PageExtension VENA Sales Receipt List (ID 82005) extends Record YVS Sales Receipt List.
/// </summary>
pageextension 82005 "VENA Sales Receipt List" extends "YVS Sales Receipt List"
{
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
