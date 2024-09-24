/// <summary>
/// TableExtension VENA Billing Receipt Header (ID 82001) extends Record YVS Billing Receipt Header.
/// </summary>
tableextension 82001 "VENA Billing Receipt Header" extends "YVS Billing Receipt Header"
{
    fields
    {
        field(82000; "VENA Total Sales (LCY)"; Decimal)
        {
            Caption = 'Total Sales (LCY)';
            FieldClass = FlowField;
            CalcFormula = Sum("YVS Billing Receipt Line"."VENA Sales (LCY)" WHERE("Document Type" = FIELD("Document Type"),
            "Document No." = FIELD("No.")));
        }
    }
}
