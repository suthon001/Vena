/// <summary>
/// PageExtension VENA Posted Sales Invoices (ID 82003) extends Record Posted Sales Invoices.
/// </summary>
pageextension 82003 "VENA Posted Sales Invoices" extends "Posted Sales Invoices"
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
