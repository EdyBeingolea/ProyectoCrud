package pe.edu.vallegrande.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.spec.clienteSpec;

public class clientesService implements clienteSpec<clienteModel> {

	@Override
	public List<clienteModel> ListarTodos() {
		List<clienteModel> cliente = new ArrayList<clienteModel>();
		clienteModel model = null;
		Connection cn = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select * from customer";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				model = new clienteModel();
				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setAddress(rs.getString(3));
				model.setPhone(rs.getString(4));
				model.setStatus(rs.getString(5));
				cliente.add(model);
			}
			rs.close();
			pstm.execute();
		} catch (Exception e) {
			System.out.println("Error en listar Todos");
		}
		return cliente;
	}

	@Override
	public List<clienteModel> ListarActivos() {
		List<clienteModel> cliente = new ArrayList<clienteModel>();
		clienteModel model = null;
		Connection cn = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select * from customer where status = 'A'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				model = new clienteModel();
				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setAddress(rs.getString(3));
				model.setPhone(rs.getString(4));
				cliente.add(model);
			}
			rs.close();
			pstm.execute();
		} catch (Exception e) {
			System.out.println("Error en listar Activos");
		}
		return cliente;
	}

	@Override
	public List<clienteModel> ListarInactivos() {
		List<clienteModel> cliente = new ArrayList<clienteModel>();
		clienteModel model = null;
		Connection cn = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select * from customer where status = 'I'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				model = new clienteModel();
				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setAddress(rs.getString(3));
				model.setPhone(rs.getString(4));
				cliente.add(model);
			}
			rs.close();
			pstm.execute();
		} catch (Exception e) {
			System.out.println("Error en listar Activos");
		}
		return cliente;
	}

	@Override
	public clienteModel FiltroID(Integer id) {
		Connection cn = null;
		clienteModel bean = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select name,address,phone from " + "where status = 'A' and id = ? ";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new clienteModel();
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setAddress(rs.getString(3));
				bean.setPhone(rs.getString(4));
			}
			rs.close();
			pstm.close();
		} catch (Exception e) {
			System.out.println("Error en buscador por id");
		}
		return bean;
	}

	@Override
	public List<clienteModel> Busqueda(clienteModel bean) {
		String name = "%" + bean.getName().trim() + "%";
		String address = "%" + bean.getAddress().trim() + "%";
		String phone = "%" + bean.getPhone().trim() + "%";
		List<clienteModel> lista = new ArrayList<>();
		Connection cn = null;
		clienteModel model = null;
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
				model = new clienteModel();
				model.setId(rs.getInt("id"));
				model.setName(rs.getString("name"));
				model.setAddress(rs.getString("address"));
				model.setPhone(rs.getString("phone"));
				lista.add(model);
			}
			rs.close();
			psmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el Busqueda");
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
	public clienteModel insert(clienteModel bean) {
		Integer id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql = "INSERT INTO CUSTOMER (name,address,phone) " + "values (?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getAddress());
			pstm.setString(3, bean.getPhone());
			pstm.execute();
			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			id = rs.getInt("id");
			bean.setId(id);
			cn.commit();
		} catch (Exception e) {
			System.out.println("Error en Insertar");
		}
		return bean;
	}

	@Override
	public clienteModel update(clienteModel bean) {
		Integer id;
		Connection cn;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "UPDATE CUSTOMER SET name = ?,address = ?,phone = ? WHERE id = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getAddress());
			pstm.setString(3, bean.getPhone());
			pstm.setInt(4, bean.getId());
			pstm.executeUpdate();

			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			cn.commit();
		} catch (Exception e) {
			System.out.println("Error en actualizar");
		}
		return bean;
	}

	@Override
	public void delete(Integer id) {
		Connection cn = null;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "UPDATE customer SET status='I' WHERE id=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			cn.commit();
		} catch (Exception e) {
			System.out.println("Error en el Eliminado Logico");
		}
	}

	@Override
	public void restore(Integer id) {
		Connection cn = null;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "UPDATE customer SET status='A' WHERE id=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			cn.commit();
		} catch (Exception e) {
			System.out.println("Error en el Restaurar");
		}
	}

}
