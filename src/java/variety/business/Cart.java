
package variety.business;

import java.util.*;
import java.io.Serializable;

public class Cart implements Serializable {

    private List<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<LineItem> lineItems) {
        items = lineItems;
    }

    public List<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LineItem item) {
        //If the item already exists in the cart, only the quantity is changed.
        Long id = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getId().equals(id)) {
                lineItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(LineItem item) {
        Long id = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(id)) {
                items.remove(i);
                return;
            }
        }
    }
}
