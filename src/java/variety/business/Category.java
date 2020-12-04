
package variety.business;

/**
 *
 * @author Sophie
 */

import java.io.Serializable;

public class Category implements Serializable {

    private Long categoryId;    
    private String name;

    public Category() {}

    public Long getId() {
        return categoryId;
    }

    public void setId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

}
