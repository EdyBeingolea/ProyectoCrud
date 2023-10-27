package pe.edu.vallegrande.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.EmpleadoModel;
import pe.edu.vallegrande.service.spec.CrudServiceSpecs;

public class EmpleadoService implements CrudServiceSpecs<EmpleadoModel> {

	@Override
	public List<EmpleadoModel> getAll() {
		List<EmpleadoModel> lista = new ArrayList<EmpleadoModel>();
		Connection cn = null;
		EmpleadoModel rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,lastName,dni from Employee where status = 'A'";
			PreparedStatement psmt = cn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				rec = new EmpleadoModel();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				//rec.setLastName(rs.getString("lastName"));
				rec.setDni(rs.getString("dni"));
					
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
	public EmpleadoModel getById(Integer id) {
		Connection cn = null;
		EmpleadoModel bean = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,lastName,dni from Employee ";
			sql += "where status = 'A' and id = ? ";
			PreparedStatement psmt = cn.prepareStatement(sql);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				bean = new EmpleadoModel();
				bean.setId(rs.getInt("id"));
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setLastName(rs.getString("lastName"));
				bean.setDni(rs.getString("dni"));
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
	public List<EmpleadoModel> get(EmpleadoModel bean) {
		String name = "%" + bean.getName().trim() + "%";
		String lastname = "%" + bean.getLastName().trim() + "%";
		String dni = "%" + bean.getDni().trim() + "%";
		List<EmpleadoModel> lista = new ArrayList<>();
		Connection cn = null;
		EmpleadoModel rec = null;

		try {
			cn = AccesoDB.getConnection();
			String sql = "select id,name,lastName,dni from Employee ";
			sql += "where status = 'A' and name  like ? and lastName like ?and dni  like ?";
			PreparedStatement psmt = cn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, lastname);
			psmt.setString(3, dni);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				rec = new EmpleadoModel();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				rec.setLastName(rs.getString("lastName"));
				rec.setDni(rs.getString("dni"));
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
	public EmpleadoModel insert(EmpleadoModel bean) {
		Integer id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;

		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "INSERT INTO Employee (name,lastName,dni) values (?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getDni());
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
				System.out.println("Registro fallo con el id = " + e2.getMessage());
			}
			throw new RuntimeException("Error en el proceso"+e.getMessage());
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
	public EmpleadoModel update(EmpleadoModel bean) {
		Integer id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;

		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "UPDATE Employee SET name = ?,lastName = ?,dni = ? WHERE id = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getDni());
			pstm.setInt(4,bean.getId());
			pstm.executeUpdate();

			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
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
	public void delete(Integer id) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		int filas;

		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);

			sql = "UPDATE Employee SET status='I' WHERE id=?";
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
