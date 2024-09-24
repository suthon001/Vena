/// <summary>
/// PageExtension VENA Purchase Vat Card (ID 82007) extends Record YVS Purchase Vat Card.
/// </summary>
pageextension 82007 "VENA Purchase Vat Card" extends "YVS Purchase Vat Card"
{
    actions
    {
        addafter("Purchase Vat Report")
        {
            action("VENAPurchase Vat Report")
            {
                Caption = 'รายงานภาษีซื้อ';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Image = PrintVAT;
                ToolTip = 'Executes the รายงานภาษีซื้อ action.';
                trigger OnAction()
                var
                    TaxReportHeader: Record "YVS Tax & WHT Header";
                    ReportPurchaseVat: Report "VENA Purchase Vat Report";

                begin

                    Clear(ReportPurchaseVat);
                    TaxReportHeader.Reset();
                    TaxReportHeader.SetRange("Tax Type", Rec."Tax Type");
                    TaxReportHeader.SetRange("Document No.", Rec."Document No.");
                    TaxReportHeader.FindFirst();
                    ReportPurchaseVat.SetTableView(TaxReportHeader);
                    ReportPurchaseVat."SetFilter"(vatBusFilter, VatProdFilter, DateFilter);
                    ReportPurchaseVat.Run();
                    Clear(ReportPurchaseVat);
                end;
            }
        }
        modify("Purchase Vat Report")
        {
            Visible = false;
        }
    }
}
