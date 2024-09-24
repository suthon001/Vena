/// <summary>
/// Unknown VENA Permission (ID 82000).
/// </summary>
permissionset 82000 "VENA Permission"
{
    Assignable = true;
    Caption = 'Permission', MaxLength = 30;
    Permissions =
        codeunit "VENA Func" = X,
        report "VENA Sales Invoice (Post)" = X,
        report "VENA AR Voucher" = X,
        report "VENA AR Voucher (Post)" = X,
        report "VENA Report Sales Invoice" = X,
        report "VENA Purchase Vat Report" = X,
        report "VENA Sales Receipt" = X;
}
