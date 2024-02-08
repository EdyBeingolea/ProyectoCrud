package pe.edu.vallegrande.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.conexion.Acceso;
import pe.edu.vallegrande.model.empleadoModel;

public class empleadoService implements CRUD<empleadoModel> {

	@Override
	public List<empleadoModel> getAll() {
		List<empleadoModel> empleado = new ArrayList<>();
		String sql = "select * from Employee";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				empleadoModel emp = new empleadoModel();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setLastName(rs.getString("lastName"));
				emp.setType_document(rs.getString("type_document"));
				emp.setNumber_document(rs.getString("number_document"));
				emp.setCell_phone(rs.getString("cell_phone"));
				emp.setStatus(rs.getString("status"));
				empleado.add(emp);
			}

		} catch (Exception e) {
			System.out.println("Error en listar todos los empleados");
		}
		return empleado;
	}

	@Override
	public List<empleadoModel> getActive() {
		List<empleadoModel> empleado = new ArrayList<>();
		String sql = "select id ,name, lastName,type_document ,number_document ,cell_phone ,status  from Employee  where status= 'A' ORDER BY id ASC ;";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				empleadoModel emp = new empleadoModel();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setLastName(rs.getString("lastName"));
				emp.setType_document(rs.getString("type_document"));
				emp.setNumber_document(rs.getString("number_document"));
				emp.setCell_phone(rs.getString("cell_phone"));
				emp.setStatus(rs.getString("status"));
				empleado.add(emp);
			}

		} catch (Exception e) {
			System.out.println("Error en listar Activos los empleados");
		}
		return empleado;
	}

	@Override
	public List<empleadoModel> getInactive() {
		List<empleadoModel> empleado = new ArrayList<>();
		String sql = "select id ,name, lastName,type_document ,number_document ,cell_phone ,status  from Employee  where status= 'I' ORDER BY id ASC ;";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				empleadoModel emp = new empleadoModel();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setLastName(rs.getString("lastName"));
				emp.setType_document(rs.getString("type_document"));
				emp.setNumber_document(rs.getString("number_document"));
				emp.setCell_phone(rs.getString("cell_phone"));
				emp.setStatus(rs.getString("status"));
				empleado.add(emp);
			}

		} catch (Exception e) {
			System.out.println("Error en listar inactivo los empleados");
		}
		return empleado;
	}

	@Override
	public empleadoModel getByid(int id) {
		empleadoModel empleado = null;
		String sql = "SELECT * FROM Employee WHERE id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				empleado = new empleadoModel();
				empleado.setId(rs.getInt("id"));
				empleado.setName(rs.getString("name"));
				empleado.setLastName(rs.getString("lastName"));
				empleado.setType_document(rs.getString("type_document"));
				empleado.setNumber_document(rs.getString("number_document"));
				empleado.setCell_phone(rs.getString("cell_phone"));
				empleado.setStatus(rs.getString("status"));

			}
		} catch (Exception e) {
			System.out.println("Error buscar por id empleados");
		}
		return empleado;
	}

	@Override
	public empleadoModel insert(empleadoModel bean) {
		String sql = "INSERT INTO Employee (name, lastName, type_document, number_document, cell_phone, status) VALUES (?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getType_document());
			pstm.setString(4, bean.getNumber_document());
			pstm.setString(5, bean.getCell_phone());
			pstm.setString(6, bean.getStatus());
			pstm.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error en ingresar nuevos empleados" + e.getMessage());
		}
		return bean;
	}

	@Override
	public empleadoModel update(empleadoModel bean) {
		String sql = "UPDATE Employee SET name = ?, lastName = ?, type_document = ?, number_document = ?, cell_phone = ?, status= ? where id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getType_document());
			pstm.setString(4, bean.getNumber_document());
			pstm.setString(5, bean.getCell_phone());
			pstm.setString(6, bean.getStatus());
			pstm.setInt(7, bean.getId());
			pstm.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error en Actualizar los empleados" + e.getMessage());
		}
		return bean;
	}

	@Override
	public void delete(Integer id) {
		String sql = "update Employee set status = 'I' where id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error en eliminar de manera logica un empleado");
		}

	}

	@Override
	public void restore(Integer id) {
		String sql = "update Employee set status = 'A' where id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("error en restaurar empleado");
		}
	}

}
