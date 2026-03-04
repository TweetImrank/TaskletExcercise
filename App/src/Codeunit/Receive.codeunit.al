codeunit 90103 "MOB WMS Receive ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MOB WMS Receive", 'OnGetReceiveOrderLines_OnAfterSetFromWarehouseReceiptLine', '', true, true)]
    local procedure OnGetReceiveOrderLines_OnAfterSetFromWarehouseReceiptLine(_WhseReceiptLine: Record "Warehouse Receipt Line"; var _BaseOrderLineElement: Record "MOB Ns BaseDataModel Element")
    var
        Item: Record "Item";
    begin
        Item.Get(_BaseOrderLineElement.Get_ItemNumber());
        if Item."Warehouse Class Code" <> '' then
            _BaseOrderLineElement.Set_DisplayLine4(Item."Warehouse Class Code");

        _BaseOrderLineElement.Set_ValidateToBin(true); // This will enable validation to Bin on the mobile client, and will trigger the standard validation when user tries to register to a bin.
    end;
}