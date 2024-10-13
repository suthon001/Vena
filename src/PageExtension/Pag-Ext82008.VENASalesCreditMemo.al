/// <summary>
/// PageExtension VENA Sales Credit Memo (ID 82008) extends Record Sales Credit Memo.
/// </summary>
pageextension 82008 "VENA Sales Credit Memo" extends "Sales Credit Memo"
{
    actions
    {
        addafter(Print_Sales_CreditMemo)
        {
            action("VENAPrint_Sales_CreditMemo")
            {
                ApplicationArea = All;
                Caption = 'Sales Credit Memo';
                Image = PrintReport;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                ToolTip = 'Show Report';
                Visible = CheckDisableLCL;
                trigger OnAction()
                var
                    RecSalesHeader: Record "Sales Header";
                begin
                    RecSalesHeader.RESET();
                    RecSalesHeader.SetRange("Document Type", rec."Document Type");
                    RecSalesHeader.SetRange("No.", rec."No.");
                    Report.Run(Report::"VENA Report Sales Credit Memo", TRUE, TRUE, RecSalesHeader);
                end;
            }
        }
        modify(Print_Sales_CreditMemo)
        {
            Visible = false;
        }
    }
    trigger OnOpenPage()
    begin
        CheckDisableLCL := FuncenterYVS.CheckDisableLCL();
    end;

    var
        CheckDisableLCL: Boolean;
        FuncenterYVS: Codeunit "YVS Function Center";
}
