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
    }
}
