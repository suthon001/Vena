/// <summary>
/// PageExtension VENA Sales Receipt Subform (ID 82000) extends Record YVS Sales Receipt Subform.
/// </summary>
pageextension 82000 "VENA Sales Receipt Subform" extends "YVS Sales Receipt Subform"
{
    layout
    {
        addafter(Amount)
        {
            field("VENA Sales (LCY)"; rec."VENA Sales (LCY)")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Sales (LCY) field.';
            }
        }
    }
}
