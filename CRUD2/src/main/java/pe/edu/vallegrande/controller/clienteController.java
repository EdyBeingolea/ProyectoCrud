package pe.edu.vallegrande.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.clienteService;

@WebServlet(urlPatterns = { "/listarTodos", "/listarActivos", "/listarInactivos", "/mostrarEditar", "/Agregar",
		"/Editar", "/Eliminar", "/Restaurar", })
public class clienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	clienteService service = new clienteService();

	public clienteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/listarActivos":
			listarActivos(request, response);
			break;
		case "/listarInactivos":
			listarInactivos(request, response);
			break;
		case "/mostrarEditar":
			mostrarEditar(request, response);
			break;
		case "/listarTodos":
			listarTodos(request, response);
			break;
		}
	}

	private void mostrarEditar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id_editar = Integer.parseInt(request.getParameter("id_editar"));
		clienteModel editar = service.getByid(id_editar);
		request.getSession().setAttribute("editar", editar);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Editar.jsp");
		dispatcher.forward(request, response);

	}

	private void listarInactivos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Exito en inactivos");
		List<clienteModel> Inactivos = new ArrayList<>();
		Inactivos = service.getInactive();
		request.setAttribute("Inactivos", Inactivos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Inactivo.jsp");
		dispatcher.forward(request, response);

	}

	private void listarActivos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("listado Activos");
		List<clienteModel> Activos = new ArrayList<>();
		Activos = service.getActive();
		request.setAttribute("Activos", Activos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Activo.jsp");
		dispatcher.forward(request, response);

	}

	private void listarTodos(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("listado correcto");
		List<clienteModel> listarTodos = new ArrayList<>();
		listarTodos = service.getAll();
		request.setAttribute("listarTodos", listarTodos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getServletPath();
		switch (accion) {
		case "/Agregar":
			agregar(request, response);
			break;
		case "/Editar":
			editar(request, response);
			break;
		case "/Eliminar":
			eliminar(request, response);
			break;
		case "/Restaurar":
			restaurar(request, response);
			break;
		}
	}

	private void restaurar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_delete = Integer.parseInt(request.getParameter("id_delete"));
		service.restore(id_delete);
		response.sendRedirect("listarTodos");
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_delete = Integer.parseInt(request.getParameter("id_delete"));
		service.delete(id_delete);
		response.sendRedirect("listarTodos");

	}

	private void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		clienteModel cliente = (clienteModel) request.getSession().getAttribute("editar");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String birthdayDate = request.getParameter("birthdayDate");
		String document = request.getParameter("document");
		String documentNumber = request.getParameter("documentNumber");
		String status = request.getParameter("status");
		if (status == null || status.isEmpty()) {
			status = "A";
		}

		cliente.setName(name);
		cliente.setAddress(address);
		cliente.setPhone(phone);
		cliente.setBirthdayDate(birthdayDate);
		cliente.setStatus(status);
		cliente.setDocument(document);
		cliente.setDocumentNumber(documentNumber);
		service.update(cliente);
		response.sendRedirect("listarTodos");
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String birthdayDate = request.getParameter("birthdayDate");
		String document = request.getParameter("document");
		String documentNumber = request.getParameter("documentNumber");
		String status = request.getParameter("status");
		if (status == null || status.isEmpty()) {
			status = "A";
		}
		clienteModel cliente = new clienteModel();
		cliente.setName(name);
		cliente.setAddress(address);
		cliente.setPhone(phone);
		cliente.setBirthdayDate(birthdayDate);
		cliente.setDocument(document);
		cliente.setDocumentNumber(documentNumber);
		cliente.setStatus(status);
		service.insert(cliente);
		response.sendRedirect("listarTodos");

	}

}
