package carmart;

public class CartItem {

    private Car car;
    private int quantity;

    public CartItem(Car car) {
        this.car = car;
        this.quantity = 1;
    }

    public Car getCar() {
        return car;
    }

    public int getQuantity() {
        return quantity;
    }

    public void increaseQuantity() {
        quantity++;
    }

    public void decreaseQuantity() {
        if (quantity > 1) {
            quantity--;
        }
    }

    public double getTotal() {
        return car.getPrice() * quantity;
    }
}