/// <summary>
/// Codeunit VENA Func (ID 82000).
/// </summary>
codeunit 82000 "VENA Func"
{
    [EventSubscriber(ObjectType::Page, Page::"YVS Get Cus. Ledger Entry", 'YVSBeforModifyBillingLine', '', false, false)]
    local procedure YVSBeforModifyBillingLine(var pBillRcptLine: Record "YVS Billing Receipt Line")
    begin
        if pBillRcptLine.Amount <> 0 then
            pBillRcptLine."VENA Sales (LCY)" := ABS(pBillRcptLine.Amount) - Round((ABS(pBillRcptLine.Amount) * pBillRcptLine."VAT %") / (100 + pBillRcptLine."Vat %"), 0.01)
        else
            pBillRcptLine."VENA Sales (LCY)" := 0;

        if pBillRcptLine."Source Document Type" = pBillRcptLine."Source Document Type"::"Credit Memo" then
            pBillRcptLine."VENA Sales (LCY)" := -ABS(pBillRcptLine."VENA Sales (LCY)");

    end;
}
