package pe.edu.vallegrande.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.ClienteModel;
import pe.edu.vallegrande.service.spec.CrudServiceSpecs;

public class ClienteService implements CrudServiceSpecs<ClienteModel> {

	@Override
	public List<ClienteModel> getAll() {
		List<ClienteModel> lista = new ArrayList<ClienteModel>();
		Connection cn = null;
		ClienteModel rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,address,phone from Customer where status = 'A'";
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
		Connection cn = null;
		ClienteModel bean = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,address,phone from Customer ";
			sql += "where status = 'A' and id = ? ";
			PreparedStatement psmt = cn.prepareStatement(sql);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				bean = new ClienteModel();
				bean.setId(rs.getInt("id"));
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone(rs.getString("phone"));
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
		return bean;
	}

	@Override
	public List<ClienteModel> get(ClienteModel bean) {
		String name = "%" + bean.getName().trim() + "%";
		String address = "%" + bean.getAddress().trim() + "%";
		String phone = "%" + bean.getPhone().trim() + "%";
		List<ClienteModel> lista = new ArrayList<>();
		Connection cn = null;
		ClienteModel rec = null;

		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,address,phone from Customer ";
			sql += "where status = 'A' and name  like ? and address like ?and phone  like ?";
			PreparedStatement psmt = cn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, address);
			psmt.setString(3, phone);
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
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e) {
			}
		}
		return lista;
	}

	@Override
	public ClienteModel insert(ClienteModel bean) {
		Integer id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;

		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "INSERT INTO CUSTOMER (name,address,phone) values (?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getAddress());
			pstm.setString(3, bean.getPhone());
			pstm.executeUpdate();

			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			id = rs.getInt("id");
			bean.setId(id);
			cn.commit();
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		//
		return bean;
	}

	@Override
	public ClienteModel update(ClienteModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer id) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		int filas;

		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "UPDATE customer SET status='I' WHERE status=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

}
