/// <summary>
/// TableExtension VENA Billing Receipt Line (ID 82000) extends Record YVS Billing Receipt Line.
/// </summary>
tableextension 82000 "VENA Billing Receipt Line" extends "YVS Billing Receipt Line"
{
    fields
    {
        field(82000; "VENA Sales (LCY)"; Decimal)
        {
            Caption = 'Sales (LCY)';
            DataClassification = CustomerContent;
        }
        modify(Amount)
        {
            trigger OnAfterValidate()
            begin
                if rec.Amount <> 0 then
                    rec."VENA Sales (LCY)" := ABS(Amount) - Round((ABS(Amount) * "VAT %") / (100 + "Vat %"), 0.01)
                else
                    rec."VENA Sales (LCY)" := 0;

                if rec."Source Document Type" = rec."Source Document Type"::"Credit Memo" then
                    rec."VENA Sales (LCY)" := -ABS(rec."VENA Sales (LCY)");
            end;
        }
    }
}
