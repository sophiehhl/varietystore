
package variety.data;

import java.sql.*;
import java.util.*;

import variety.business.*;

public class ProductDB {
    //This method returns null if a product isn't found.
    public static Product selectProduct(String productName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Products "
                + "WHERE ProductID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, productName);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                return p;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    //This method returns null if a product isn't found.
    public static Product selectProduct(long productID) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Products "
                + "WHERE ProductID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setLong(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                return p;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    //This method returns null if a product isn't found.
    public static List<Product> selectProducts() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Products";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Product> products = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                products.add(p);
            }
            return products;
        } catch (SQLException e) {
            System.err.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
        public static List<Product> getRecords(int start,int total,int category)
           {
               ConnectionPool pool = ConnectionPool.getInstance();
               Connection connection = pool.getConnection();
               PreparedStatement ps = null;
               ResultSet rs = null;
               List<Product> list = new ArrayList<Product>();
               String query = "SELECT * FROM Products " + "WHERE CategoryID = '"
                       + category + "'" + " LIMIT " + (start-1) + "," + total;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
            return list;
        }
        finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            return list;
        }
    }
        
    public static List<Product> getNameASC(int start,int total,int category)
        {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            List<Product> list = new ArrayList<Product>();
            String query = "SELECT * FROM Products " + "WHERE CategoryID = '"
                    + category + "'ORDER BY ProductName ASC" + " LIMIT " + (start-1) + "," + total;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
            return list;
        }
        finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            return list;
        }
    }

    public static List<Product> getNameDESC(int start,int total,int category)
        {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            List<Product> list = new ArrayList<Product>();
            String query = "SELECT * FROM Products " + "WHERE CategoryID = '"
                    + category + "'ORDER BY ProductName DESC" + " LIMIT " + (start-1) + "," + total;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
            return list;
        }
        finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            return list;
        }
    }     
        public static List<Product> getHighPrice(int start,int total,int category)
        {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            List<Product> list = new ArrayList<Product>();
            String query = "SELECT * FROM Products " + "WHERE CategoryID = '"
                    + category + "'ORDER BY ProductPrice DESC" + " LIMIT " + (start-1) + "," + total;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
            return list;
        }
        finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            return list;
        }
    }
        public static List<Product> getLowPrice(int start,int total,int category)
        {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            List<Product> list = new ArrayList<Product>();
            String query = "SELECT * FROM Products " + "WHERE CategoryID = '"
                    + category + "'ORDER BY ProductPrice ASC" + " LIMIT " + (start-1) + "," + total;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getLong("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDetails(rs.getString("ProductDetails"));
                p.setPrice(rs.getDouble("ProductPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
            return list;
        }
        finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            return list;
        }
    }
}
