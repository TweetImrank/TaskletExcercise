tableextension 90100 "MOB WMS Whse Rcpt Line" extends "Warehouse Receipt Line"
{
    fields
    {
        field(90100; "Warehouse Class Code"; Code[10])
        {
            Description = 'Mobile WMS';
            Caption = 'Warehouse Class Code';
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."Warehouse Class Code" where("No." = field("Item No.")));
        }
    }

}