public with sharing class ProcessPurchaseOrder{
    public  void ProcessPurchaseOrder() {
       PurchaseOrder order1=new CustomerPurchaseOrder();
       PurchaseOrder order2=new EmployeePurchaseOrder(); 
       ProcessOrder(order1);
       ProcessOrder(order2);
    }
    public void ProcessOrder(PurchaseOrder order){
        system.debug('Check discount:'+order.discount());
    }
}