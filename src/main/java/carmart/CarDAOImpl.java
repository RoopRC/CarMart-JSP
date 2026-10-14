package carmart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarDAOImpl implements CarDAO {

    @Override
    public List<Car> getAllCars()
            throws ClassNotFoundException, SQLException {

        List<Car> cars = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM car";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery();

        while (rs.next()) {

            Car car = new Car();

            car.setId(rs.getInt("id"));
            car.setName(rs.getString("name"));
            car.setBrand(rs.getString("brand"));
            car.setCategory(rs.getString("category"));
            car.setPrice(rs.getDouble("price"));
            car.setYear(rs.getInt("year"));
            car.setFuelType(rs.getString("fuel_type"));
            car.setTransmission(rs.getString("transmission"));
            car.setMileage(rs.getString("mileage"));
            car.setDescription(rs.getString("description"));
            car.setImage(rs.getString("image"));

            cars.add(car);
        }

        rs.close();
        ps.close();
        con.close();

        return cars;
    }

    @Override
    public Car getCarById(int id)
            throws ClassNotFoundException, SQLException {

        Car car = null;

        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT * FROM car WHERE id = ?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs =
                ps.executeQuery();

        if (rs.next()) {

            car = new Car();

            car.setId(rs.getInt("id"));
            car.setName(rs.getString("name"));
            car.setBrand(rs.getString("brand"));
            car.setCategory(rs.getString("category"));
            car.setPrice(rs.getDouble("price"));
            car.setYear(rs.getInt("year"));
            car.setFuelType(rs.getString("fuel_type"));
            car.setTransmission(rs.getString("transmission"));
            car.setMileage(rs.getString("mileage"));
            car.setDescription(rs.getString("description"));
            car.setImage(rs.getString("image"));
        }

        rs.close();
        ps.close();
        con.close();

        return car;
    }
}