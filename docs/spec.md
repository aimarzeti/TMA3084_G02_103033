Inputs: Item list, quantities, and unit prices.
Output: Order Summary UI showing the itemized list and total price.
Rules: Calculate the total using orderTotal from lib/order_summary.dart.
Out of Scope: Payment gateway integration and receipt printing.
Check: Screen compiles cleanly, total equals RM 25.00, flutter analyze passes.
Navigation: Back button returns to the caller via Navigator.pop.
