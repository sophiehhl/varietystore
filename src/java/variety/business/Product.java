
package variety.business;

/**
 *
 * @author Sophie
 */

import java.text.NumberFormat;
import java.io.Serializable;

public class Product implements Serializable {

    private Long productId;    
    private String name;
    private String details;
    private double price;

    public Product() {}

    public Long getId() {
        return productId;
    }

    public void setId(Long productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDetails() {
        return details;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public String getPriceCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }

    public String getImageURL() {
        String imageURL = "/JavaProject2/images/" + productId + ".jpg";
        return imageURL;
    }
}
