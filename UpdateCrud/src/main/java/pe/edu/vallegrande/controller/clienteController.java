package pe.edu.vallegrande.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.db.AccesoDB;
import pe.edu.vallegrande.model.clienteModel;
import pe.edu.vallegrande.service.impl.clientesService;


@WebServlet("/clienteController")
public class clienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private clientesService service;
	
	public void init() {
		service = new clientesService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/Agregar":
				
				break;

			case "/Editar":
				
				break;
				
			case "/Eliminar":
				
				break;
				
			case "/Listar":
				listar(request, response);
				break;
			}
			
			
		} catch (Exception e) {
			System.err.println(e);
		}
		
	}
	
	
	private void listar(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
		List<clienteModel> listado = service.ListarTodos();
		request.setAttribute("listado", listado);
		RequestDispatcher dispacher = request.getRequestDispatcher("index.jsp");
		dispacher.forward(request, response);
	}
	
	
	
	

}
