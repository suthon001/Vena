/// <summary>
/// PageExtension VENA Sales Invoice (ID 82002) extends Record Sales Invoice.
/// </summary>
pageextension 82002 "VENA Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("YVS Ref. Tax Invoice Amount")
        {
            field("YVS Reason Code"; rec."Reason Code")
            {
                ApplicationArea = all;
                Caption = 'Reason Code';
                ToolTip = 'Specifies the value of the Reason Code field.';
                Visible = CheckDisableLCL;
            }
        }
    }
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
            action("VENAPrint_DebitNote")
            {
                ApplicationArea = All;
                Caption = 'Debit Note';
                Image = PrintReport;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                Visible = CheckDisableLCL;
                ToolTip = 'Executes the Debit Note action.';
                trigger OnAction()
                var
                    RecSalesHeader: Record "Sales Header";
                begin
                    RecSalesHeader.RESET();
                    RecSalesHeader.SetRange("Document Type", rec."Document Type");
                    RecSalesHeader.SetRange("No.", rec."No.");
                    Report.Run(Report::"VENA Debit Note", TRUE, TRUE, RecSalesHeader);
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
        modify(Print_DebitNote)
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

