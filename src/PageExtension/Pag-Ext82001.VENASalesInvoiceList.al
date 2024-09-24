/// <summary>
/// PageExtension VENA Sales Invoice List (ID 82001) extends Record Sales Invoice List.
/// </summary>
pageextension 82001 "VENA Sales Invoice List" extends "Sales Invoice List"
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
                Visible = CheckDisableLCL;
                ToolTip = 'Executes the AR Voucher action.';
                trigger OnAction()
                var
                    ARVoucher: Report "VENA AR Voucher";
                    SalesHeader: Record "Sales Header";
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
                Visible = CheckDisableLCL;
                ToolTip = 'Executes the Sales Invoice action.';
                trigger OnAction()
                var
                    RecSalesHeader: Record "Sales Header";
                begin
                    RecSalesHeader.RESET();
                    RecSalesHeader.SetRange("Document Type", rec."Document Type");
                    RecSalesHeader.SetRange("No.", rec."No.");
                    Report.Run(Report::"VENA Report Sales Invoice", TRUE, TRUE, RecSalesHeader);
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

