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

import pe.edu.vallegrande.model.empleadoModel;
import pe.edu.vallegrande.service.empleadoService;

@WebServlet(urlPatterns = { "/listarTodosEmpleados", "/listarActivosEmpleados", "/listarInactivosEmpleados", "/traerEmpleado",
		"/agregarEmpleado", "/editarEmpleado", "/eliminarEmpleado", "/restaurarEmpleado"})
public class empleadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	empleadoService service = new empleadoService();

	public empleadoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/listarTodosEmpleados":
			listarTodosEmpleados(request, response);
			break;
		case "/listarActivosEmpleados":
			listarActivosEmpleados(request, response);
			break;
		case "/listarInactivosEmpleados":
			listarInactivosEmpleados(request, response);
			break;
		case "/traerEmpleado":
			traerEmpleado(request, response);
			break;
		}
	}

	private void listarTodosEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hola empleado");
		List<empleadoModel> listarTodosEmpleados = new ArrayList<>();
		listarTodosEmpleados = service.getAll();
		request.setAttribute("listarTodosEmpleados", listarTodosEmpleados);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ListarEmpleados.jsp");
		dispatcher.forward(request, response);
	}

	private void listarActivosEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<empleadoModel> activos = new ArrayList<>();
		activos = service.getActive();
		request.setAttribute("activos", activos);
		RequestDispatcher dispacer = request.getRequestDispatcher("EmpleadoActivo.jsp");
		dispacer.forward(request, response);
	}

	private void listarInactivosEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<empleadoModel> inactivo = new ArrayList<>();
		inactivo = service.getInactive();
		request.setAttribute("inactivo", inactivo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EmpleadoInactivo.jsp");
		dispatcher.forward(request, response);
	}

	private void traerEmpleado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id_editar = Integer.parseInt(request.getParameter("id_editar"));
		empleadoModel editarEmp = service.getByid(id_editar);
		request.getSession().setAttribute("editarEmp", editarEmp);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EditarEmpleados.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/agregarEmpleado":
			agregarEmpleado(request, response);
			break;
		case "/editarEmpleado":
			editarEmpleado(request, response);
			break;
		case "/eliminarEmpleado":
			eliminarEmpleado(request, response);
			break;
		case "/restaurarEmpleado":
			restaurarEmpleado(request, response);
			break;
		}

	}

	private void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String lastName = request.getParameter("lastName");
		String type_document = request.getParameter("type_document");
		String number_document = request.getParameter("number_document");
		String cell_phone = request.getParameter("cell_phone");
		String status = request.getParameter("status");
		if (status == null || status.isEmpty()) {
			status = "A";
		}
		empleadoModel empleado = new empleadoModel();
		empleado.setName(name);
		empleado.setLastName(lastName);
		empleado.setType_document(type_document);
		empleado.setNumber_document(number_document);
		empleado.setCell_phone(cell_phone);
		empleado.setStatus(status);
		service.insert(empleado);
		response.sendRedirect("listarTodosEmpleados");

	}

	private void editarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		empleadoModel empleado = (empleadoModel) request.getSession().getAttribute("editarEmp");

	    // Verificar si el objeto empleado es null
	    if (empleado == null) {
	        // Manejar la situación donde el objeto empleado es null, por ejemplo, redirigir a una página de error
	        response.sendRedirect("paginaDeError.jsp");
	        System.out.println("error en editar empleado controller");
	        return; // Salir del método para evitar el NullPointerException
	    }

	    // Resto del código para obtener parámetros y actualizar el empleado
	    String name = request.getParameter("name");
	    String lastName = request.getParameter("lastName");
	    String type_document = request.getParameter("type_document");
	    String number_document = request.getParameter("number_document");
	    String cell_phone = request.getParameter("cell_phone");
	    String status = request.getParameter("status");
	    if (status == null || status.isEmpty()) {
	        status = "A";
	    }

	    // Actualizar los atributos del objeto empleado
	    empleado.setName(name);
	    empleado.setLastName(lastName);
	    empleado.setType_document(type_document);
	    empleado.setNumber_document(number_document);
	    empleado.setCell_phone(cell_phone);
	    empleado.setStatus(status);

	    // Llamar al servicio para actualizar el empleado
	    service.update(empleado);

	    // Redirigir a la página de listar todos los empleados
	    response.sendRedirect("listarTodosEmpleados");
	}

	private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_delete = Integer.parseInt(request.getParameter("id_delete"));
		service.delete(id_delete);
		response.sendRedirect("listarTodosEmpleados");
	}

	private void restaurarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id_restore = Integer.parseInt(request.getParameter("id_restore"));
		service.restore(id_restore);
		response.sendRedirect("listarTodosEmpleados");
	}

}
