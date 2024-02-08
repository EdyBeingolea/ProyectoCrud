package pe.edu.vallegrande.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.conexion.Acceso;
import pe.edu.vallegrande.model.clienteModel;

public class clienteService {

	public List<clienteModel> getAll() {
		List<clienteModel> getAll = new ArrayList<>();
		String sql = "select id ,name ,address ,phone,FORMAT(birthdayDate, 'dd/MM/yyyy') as birthdayDate,"
				+ "document ,documentNumber ,status from Customer ORDER BY id ASC ;";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				clienteModel cliente = new clienteModel();
				cliente.setId(rs.getInt("id"));
				cliente.setName(rs.getString("name"));
				cliente.setAddress(rs.getString("address"));
				cliente.setPhone(rs.getString("phone"));
				cliente.setBirthdayDate(rs.getString("birthdayDate"));
				cliente.setDocument(rs.getString("document"));
				cliente.setDocumentNumber(rs.getString("documentNumber"));
				cliente.setStatus(rs.getString("status"));
				getAll.add(cliente);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error al listar todos los clientes" + e.getMessage());
		}
		return getAll;
	}

	
	public List<clienteModel> getActive() {
		List<clienteModel> getActive = new ArrayList<>();
		String sql = "select id,name,address,phone, FORMAT(birthdayDate, 'dd/MM/yyyy') as birthdayDate,"
				+ "document,documentNumber,status from Customer where status = 'A' ORDER BY id ASC ;";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				clienteModel activo = new clienteModel();
				activo.setId(rs.getInt("id"));
				activo.setName(rs.getString("name"));
				activo.setAddress(rs.getString("address"));
				activo.setPhone(rs.getString("phone"));
				activo.setBirthdayDate(rs.getString("birthdayDate"));
				activo.setDocument(rs.getString("document"));
				activo.setDocumentNumber(rs.getString("documentNumber"));
				activo.setStatus(rs.getString("status"));
				getActive.add(activo);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error en listar clientes activos " + e.getMessage());
		}
		return getActive;
	}

	public List<clienteModel> getInactive() {
		List<clienteModel> getInactive = new ArrayList<>();
		String sql = "select id,name,address,phone,FORMAT(birthdayDate, 'dd/MM/yyyy') as birthdayDate,"
				+ "document,documentNumber,status from Customer where status= 'I' ORDER BY id ASC ;";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery();) {
			while (rs.next()) {
				clienteModel inactivos = new clienteModel();
				inactivos.setId(rs.getInt("id"));
				inactivos.setName(rs.getString("name"));
				inactivos.setAddress(rs.getString("address"));
				inactivos.setPhone(rs.getString("phone"));
				inactivos.setBirthdayDate(rs.getString("birthdayDate"));
				inactivos.setDocument(rs.getString("document"));
				inactivos.setDocumentNumber(rs.getString("documentNumber"));
				inactivos.setStatus(rs.getString("status"));
				getInactive.add(inactivos);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error en listar inanctivos " + e.getMessage());
		}

		return getInactive;
	}

	public clienteModel getByid(int id) {
		clienteModel cliente = null;
		String sql = "SELECT * FROM Customer WHERE id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				cliente = new clienteModel();
				cliente.setId(rs.getInt("id"));
				cliente.setName(rs.getString("name"));
				cliente.setAddress(rs.getString("address"));
				cliente.setPhone(rs.getString("phone"));
				cliente.setBirthdayDate(rs.getString("birthdayDate"));
				cliente.setDocument(rs.getString("document"));
				cliente.setDocumentNumber(rs.getString("documentNumber"));
				cliente.setStatus(rs.getString("status"));
			}

		} catch (Exception e) {
			System.out.println("error en  busacar clientes por su id : " + e.getMessage());
		}
		return cliente;
	}

	public clienteModel insert(clienteModel bean) {
		String sql = "INSERT INTO Customer (name, address, phone, birthdayDate, document, documentNumber, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getAddress());
			pstm.setString(3, bean.getPhone());
			pstm.setString(4, bean.getBirthdayDate());
			pstm.setString(5, bean.getDocument());
			pstm.setString(6, bean.getDocumentNumber());
			pstm.setString(7, bean.getStatus());
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("error en agegar nuevos clientes" + e.getMessage());
		}
		return bean;
	}

	public clienteModel update(clienteModel bean) {
		String sql = "UPDATE Customer SET name = ?, address = ?, phone = ?, birthdayDate = ?, document = ?, documentNumber = ?, status = ? WHERE id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getAddress());
			pstm.setString(3, bean.getPhone());
			pstm.setString(4, bean.getBirthdayDate());
			pstm.setString(5, bean.getDocument());
			pstm.setString(6, bean.getDocumentNumber());
			pstm.setString(7, bean.getStatus());
			pstm.setInt(8, bean.getId());
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("error en editar clientes" + e.getMessage());
		}
		return bean;
	}

	public void delete(Integer id) {
		String sql = "UPDATE Customer SET status = 'I' WHERE id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			pstm.executeUpdate();

		} catch (Exception e) {
			System.out.println("error en el elimanado logico el cliente no existe" + e.getMessage());
		}

	}

	public void restore(Integer id) {
		String sql = "UPDATE Customer SET status = 'A' WHERE id = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, id);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("error en restaurar el cliente no existe " + e.getMessage());
		}
	}

}
