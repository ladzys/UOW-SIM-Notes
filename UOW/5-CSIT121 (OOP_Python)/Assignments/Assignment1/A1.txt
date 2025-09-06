#T4-Mohamed Haneefa Jiyavudeen-Assignment 1

#########################################################################################################################
#Execution results
'''
C:\Users\jiyav\AppData\Local\Programs\Python\Python312\python.exe "C:\Python\CSIT121\Assignment\Assignment 1.py" 
Test 2 (Add duplicate items)
--------------------------------------------------
Ref no.: ORDER001
Recipient: Nika
Total Amount: $93.50
Product: Water bottle | Qty: 5 | Actual Amount: $50.00
Product: Notebook | Qty: 3 | Actual Amount: $13.50
Product: Pen | Qty: 15 | Actual Amount: $30.00
--------------------------------------------------
(Product: Water bottle | Qty: 5 | Actual Amount: $50.00) ALREADY EXIST!
--------------------------------------------------
Ref no.: ORDER001
Recipient: Nika
Total Amount: $93.50
Product: Water bottle | Qty: 5 | Actual Amount: $50.00
Product: Notebook | Qty: 3 | Actual Amount: $13.50
Product: Pen | Qty: 15 | Actual Amount: $30.00
--------------------------------------------------
Test 3 (Remove existing?non existing items
--------------------------------------------------
Ref no.: ORDER001
Recipient: Nika
Total Amount: $93.50
Product: Water bottle | Qty: 5 | Actual Amount: $50.00
Product: Notebook | Qty: 3 | Actual Amount: $13.50
Product: Pen | Qty: 15 | Actual Amount: $30.00
--------------------------------------------------
(Product: Notebook | Qty: 3 | Actual Amount: $13.50) HAVE BEEN REMOVED!
(Product: Pencil | Qty: 5 | Actual Amount: $5.00) DOES NOT EXIST!
--------------------------------------------------
Ref no.: ORDER001
Recipient: Nika
Total Amount: $80.00
Product: Water bottle | Qty: 5 | Actual Amount: $50.00
Product: Pen | Qty: 15 | Actual Amount: $30.00
--------------------------------------------------

End of main

Process finished with exit code 0


'''

#########################################################################################################################
#Program

#Assignment 1
import datetime

class CustOrder:
    def __init__(self, ref_no, recipient, address):
        self._ref_no = ref_no
        self._recipient = recipient
        self._address = address
        self._date_ordered = datetime.date.today()
        self._date_delivered = None
        self._items = [] #Hold orderitem objects

    def add_item(self,item):
        if item in self._items:
            print("({0}) ALREADY EXIST!".format(item))
            return False
        self._items.append(item)
        return True

    def remove_item(self, item):
        if item in self._items:
            self._items.remove(item)
            print("({0}) HAVE BEEN REMOVED!".format(item))
            return True
        print("({0}) DOES NOT EXIST!".format(item))
        return False

    def get_total(self):
        total_amount = 0
        for item in self._items:
            total_amount = item.get_actual_amount() + total_amount
        return total_amount

    def __str__(self):
        order_details = (f"Ref no.: {self._ref_no}\n"
                         f"Recipient: {self._recipient}\n"
                         f"Total Amount: ${self.get_total():.2f}\n")
        item_details = "\n".join(str(item) for item in self._items)
        return order_details + item_details



class OrderItem:
    def __init__(self, prod, unit_price, qty,  discount = 0):
        self._prod = prod
        self._unit_price = unit_price
        self._discount = discount
        self._qty = qty

    def get_total_amount(self):
        return self._unit_price * self._qty

    def get_discount_amount(self):
        return self._unit_price * self._qty * (self._discount / 100)

    def get_actual_amount(self):
        #actual amount = total amt - disc
        total_amount = self.get_total_amount()
        discount_amount = self.get_discount_amount()
        actual_amount = total_amount - discount_amount
        return actual_amount

    def __str__(self):
        return f"Product: {self._prod} | Qty: {self._qty} | Actual Amount: ${self.get_actual_amount():.2f}"

#Overall testing(Self_use)
def test1():
    # Creating OrderItems
    item1 = OrderItem("Water bottle", 10, 5)
    item2 = OrderItem("Notebook", 5, 3, discount=10)
    item3 = OrderItem("Pen", 2, 15)

    # Creating a CustOrder
    order = CustOrder("ORDER001", "Nika", "184 Bukit Batok West Avenue 1 ")

    # Adding items to the order
    order.add_item(item1)
    order.add_item(item2)
    order.add_item(item3)

    #check if added
    print("-"*50)
    print(order)
    print("-"*50)

    # Attempting to add duplicate item
    order.add_item(item1)

    # Removing an item
    order.remove_item(item2)

    # Attempting to remove a non-existing item
    non_existing_item = OrderItem("Pencil", 1, 5)
    order.remove_item(non_existing_item)

    # Printing the order details
    print("-"*50)
    print(order)
    print("-"*50)

#TESTING FOR ADDING DUPLICATE ITEMS
def test2():
    # Creating OrderItems
    item1 = OrderItem("Water bottle", 10, 5)
    item2 = OrderItem("Notebook", 5, 3, discount=10)
    item3 = OrderItem("Pen", 2, 15)

    # Creating a CustOrder
    order = CustOrder("ORDER001", "Nika", "184 Bukit Batok West Avenue 1 ")

    # Adding items to the order
    order.add_item(item1)
    order.add_item(item2)
    order.add_item(item3)

    #check if added
    print("-"*50)
    print(order)
    print("-"*50)

    # Attempting to add duplicate item
    order.add_item(item1)

    #Check if any amendments have been made
    print("-"*50)
    print(order)
    print("-"*50)


#TESTING FOR REMOVING EXISTING ITEM/NON-EXISTING ITEMS
def test3():
    # Creating OrderItems
    item1 = OrderItem("Water bottle", 10, 5)
    item2 = OrderItem("Notebook", 5, 3, discount=10)
    item3 = OrderItem("Pen", 2, 15)

    # Creating a CustOrder
    order = CustOrder("ORDER001", "Nika", "184 Bukit Batok West Avenue 1 ")

    # Adding items to the order
    order.add_item(item1)
    order.add_item(item2)
    order.add_item(item3)

    #check if added
    print("-"*50)
    print(order)
    print("-"*50)

    # Removing an item
    order.remove_item(item2)

    # Attempting to remove a non-existing item
    non_existing_item = OrderItem("Pencil", 1, 5)
    order.remove_item(non_existing_item)

    # Printing the order details
    print("-"*50)
    print(order)
    print("-"*50)


def main():
    #test1()
    print("Test 2 (Add duplicate items)")
    test2()
    print("Test 3 (Remove existing?non existing items)")
    test3()

    print()
    print("End of main")
main()


