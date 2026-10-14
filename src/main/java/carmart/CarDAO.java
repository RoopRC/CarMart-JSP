package carmart;

import java.sql.SQLException;
import java.util.List;

public interface CarDAO {

    List<Car> getAllCars()
            throws ClassNotFoundException, SQLException;

    Car getCarById(int id)
            throws ClassNotFoundException, SQLException;
}