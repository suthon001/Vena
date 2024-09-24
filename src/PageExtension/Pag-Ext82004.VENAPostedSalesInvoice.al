/// <summary>
/// PageExtension VENA Posted Sales Invoice (ID 82004) extends Record Posted Sales Invoice.
/// </summary>
pageextension 82004 "VENA Posted Sales Invoice" extends "Posted Sales Invoice"
{
    actions
    {
        addafter("AR Voucher")
        {
            action("VENAAR Voucher")
            {
                Caption = 'AR Voucher';
                Image = PrintVoucher;
                ApplicationArea = all;
                PromotedCategory = Report;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the AR Voucher action.';
                Visible = CheckDisableLCL;
                trigger OnAction()
                var
                    ARVoucher: Report "VENA AR Voucher (Post)";
                    SalesHeader: Record "Sales Invoice Header";
                begin
                    SalesHeader.reset();
                    SalesHeader.Copy(Rec);
                    ARVoucher."SetGLEntry"(SalesHeader);
                    ARVoucher.RunModal();
                end;
            }
            action("VENAPrint_Sales_Invoice")
            {
                ApplicationArea = All;
                Caption = 'Sales Invoice';
                Image = PrintReport;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                ToolTip = 'Executes the Sales Invoice action.';
                Visible = CheckDisableLCL;
                trigger OnAction()
                var
                    RecSalesHeader: Record "Sales Invoice Header";
                begin
                    RecSalesHeader.RESET();
                    RecSalesHeader.SetRange("No.", rec."No.");
                    Report.Run(Report::"VENA Sales Invoice (Post)", TRUE, TRUE, RecSalesHeader);
                end;
            }
        }
        modify("AR Voucher")
        {
            Visible = false;
        }
        modify(Print_Sales_Invoice)
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
