permissionset 82000 "VENA Permission"
{
    Assignable = true;
    Caption = 'Permission', MaxLength = 30;
    Permissions =
        report "VENA AR Voucher (Post)" = X,
        report "VENA AR Voucher" = X,
        report "VENA Purchase Vat Report" = X,
        report "VENA Sales Receipt" = X,
        report "VENA Sales Invoice (Post)" = X,
        report "VENA Report Sales Invoice" = X,
        report "VENA Debit Note" = X,
        report "VENA Debit Note (Post)" = X,
        report "VENA Sales Credit Memo (Post)" = X,
        report "VENA Report Sales Credit Memo" = X,
        codeunit "VENA Func" = X;
}
