pageextension 82012 "VENA Sales Vat Card" extends "YVS Sales Vat Card"
{
    actions
    {
        addafter("Sales Vat Report")
        {
            action("VENASales Vat Report")
            {
                Caption = 'รายงานภาษีขาย';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = PrintVAT;
                ToolTip = 'Executes the รายงานภาษีขาย action.';
                trigger OnAction()
                var
                    TaxReportHeader: Record "YVS Tax & WHT Header";
                    ReportSalesVat: Report "VENA Sales Vat";
                begin

                    Clear(ReportSalesVat);
                    TaxReportHeader.Reset();
                    TaxReportHeader.SetRange("Tax Type", Rec."Tax Type");
                    TaxReportHeader.SetRange("Document No.", Rec."Document No.");
                    TaxReportHeader.FindFirst();
                    ReportSalesVat.SetTableView(TaxReportHeader);
                    ReportSalesVat."SetFilter"(vatBusFilter, VatProdFilter, DateFilter);
                    ReportSalesVat.Run();
                    Clear(ReportSalesVat);
                end;
            }
        }
        modify("Sales Vat Report")
        {
            Visible = false;
        }
    }
}

