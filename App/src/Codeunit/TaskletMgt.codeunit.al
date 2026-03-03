codeunit 90100 TaskletMgt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MOB WMS Receive", 'OnGetReceiveOrders_OnAfterSetFromWarehouseReceiptHeader', '', true, true)]
    local procedure MyOnGetReceiveOrders_OnAfterSetFromWarehouseReceiptHeader(_WhseReceiptHeader: Record "Warehouse Receipt Header"; var _BaseOrderElement: Record "MOB Ns BaseDataModel Element")
    begin
        _BaseOrderElement.Set_DisplayLine2(_BaseOrderElement.Get_DisplayLine2() + ' - ' + Format(_WhseReceiptHeader."Document Status"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MOB WMS Receive", 'OnGetReceiveOrders_OnSetFilterWarehouseReceipt', '', true, true)]
    local procedure MyOnGetReceiveOrders_OnSetFilterWarehouseReceipt(_HeaderFilter: Record "MOB NS Request Element"; var _WhseReceiptHeader: Record "Warehouse Receipt Header"; var _WhseReceiptLine: Record "Warehouse Receipt Line"; var _IsHandled: Boolean)
    begin
        // [Scenario] Overrule when the standard filter "Scanned Value".
        // [Scenario] Instead of searching for Item No., use the value to filter Document no.
        // [Scenario] Handle the filter, so standard filter is overruled

        if _HeaderFilter.Name = 'LocationFilter' then begin
            _WhseReceiptHeader.SetRange("No.", 'YELLOW');
            _IsHandled := true;  // Handle the filter, so standard filter is overruled
        end;
    end;
}