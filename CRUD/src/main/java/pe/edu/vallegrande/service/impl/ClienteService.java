package pe.edu.vallegrande.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.spec.CrudServiceSpecs;

public class ClienteService implements CrudServiceSpecs<ClienteModel>{

	@Override
	public List<ClienteModel> getAll() {
		List<ClienteModel> lista = new ArrayList<ClienteModel>();
		Connection cn = null;
		ClienteModel rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,address,phone from Customer where state = 'A'";
			PreparedStatement psmt = cn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				rec = new ClienteModel();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				rec.setAddress(rs.getString("address"));
				rec.setPhone(rs.getString("phone"));
				lista.add(rec);
			}
			rs.close();
			psmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

	@Override
	public ClienteModel getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClienteModel> get(ClienteModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClienteModel insert(ClienteModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClienteModel update(ClienteModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
