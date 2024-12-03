package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Usuario;
import model.Produto;

public class ProdutoDAO {
    
    private static Connection conn;
    
    public ProdutoDAO() throws SQLException, ClassNotFoundException {
        conn = Conexao.getConn();
    }
    
    public ArrayList<Produto> getAllProdutos() throws SQLException {
        
       ArrayList<Produto> produ = new ArrayList(); 
       
       String query = "select * from produto;";
       
       PreparedStatement prep = conn.prepareStatement(query);
       
       ResultSet res = prep.executeQuery();
       
       while( res.next() ) {
           Produto prod = new Produto();
           
           prod.setCodigo(res.getInt("codigo") );
           prod.setNome(res.getString("nome") );
           prod.setMarca(res.getString("marca") );
           prod.setPreco(res.getDouble("preco") );
 
           
           produ.add(prod);
       }
       
       prep.close();
       return produ;
    }
    
    
    public void setNewProduto(Produto prod) throws SQLException {
        String query = "insert into produto(codigo, nome, marca,preco) "
                     + "values(?, ?, ?, ?)";
        
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, prod.getCodigo());
        prep.setString(2, prod.getNome());
        prep.setString(3, prod.getMarca());
        prep.setDouble(4,prod.getPreco());
  
        
        prep.execute();
        prep.close();
    }
    
    public void deleteProduto(int id) throws SQLException{
        String query = "delete from produto "
                     + "where id = " + id;
        
        PreparedStatement prep = conn.prepareStatement(query);
        
        prep.execute();
        prep.close();
    }
    
        public Produto getOneProdutO(int id) throws SQLException {
            String query = "select * from produto where id = " + id;
            
            PreparedStatement prep = conn.prepareStatement(query);
            
            ResultSet res = prep.executeQuery();
            
            Produto prod = new Produto();
            
            if(res.next()) {
                prod.setCodigo(res.getInt("codigo"));
                prod.setNome(res.getString("nome"));
                prod.setMarca(res.getString("marca"));
                prod.setPreco(res.getDouble("preco"));
                
            }
            
            
            prep.close();
            return prod;
        }
        
        
                public Produto getOneProduto(int codigo) throws SQLException {
            String query = "select * from Produto where codigo = ?";
            
            PreparedStatement prep = conn.prepareStatement(query);
            
            prep.setInt(1, codigo);
            
            ResultSet res = prep.executeQuery();
            
            Produto prod = new Produto();
            
            if(res.next()) {
                prod.setCodigo(res.getInt("codigo"));
                prod.setNome(res.getString("nome"));
                prod.setMarca(res.getString("marca"));
                prod.setPreco(res.getDouble("preco"));
                
            }
            
            
            prep.close();
            return prod;
        }
        
        
        public void updateProduto(Produto prod) throws SQLException {
        String query = "update produto set codigo = ?, "
                + "nome = ?, marca = ?, preco = ? ";
               
        
        PreparedStatement prep = conn.prepareStatement(query);
        
        prep.setInt(1, prod.getCodigo());
        prep.setString(2, prod.getNome());
        prep.setString(3, prod.getMarca());
        prep.setDouble(4,prod.getPreco());
        
        prep.execute();
        prep.close();
    }
}