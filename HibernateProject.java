package com.HibernateWebProject.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.HibernateWebProject.Bean.Admin;
import com.HibernateWebProject.Bean.Emp;

/**
 * Servlet implementation class HibernateProject
 */
@WebServlet("/")
public class HibernateProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public HibernateProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String path=request.getServletPath();
		switch(path)
		{
		case "/reg":adminReg(request,response);
			break;
		case "/login":loginAdmin(request,response);
			break;
		case"/empreg":regEmployee(request,response);
			break;
		case"/empdata":getEmpData(request,response);
			break;
		case"/delemp":deleteEmp(request,response);
		break;
		case"/getempdata":getDataFromEmp(request,response);
		break;
		case"/updateemp":updateEmpData(request,response);
			break;
			
		case"/logout":getLogout(request,response);
		break;
			
			
		}
	}

	private void getLogout(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect("adminlogin.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	private void updateEmpData(HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("ename");
		int salary=Integer.parseInt(request.getParameter("esalary"));
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		Emp edata=ss.get(Emp.class,id);
		edata.setName(name);
		edata.setSalary(salary);
		ss.update(edata);
		
		try {
			response.sendRedirect("adminhome.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		t.commit();
	}


	private void getDataFromEmp(HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session  ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		Emp edata=ss.get(Emp.class,id);
		request.setAttribute("userdata", edata);
		RequestDispatcher rd=request.getRequestDispatcher("emp.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		t.commit();
	}


	private void deleteEmp(HttpServletRequest request, HttpServletResponse response) {
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		int id=Integer.parseInt(request.getParameter("id"));
		Emp udata=ss.get(Emp.class,id);
		ss.delete(udata);
		t.commit();
		try {
			response.sendRedirect("adminhome.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	private void getEmpData(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Emp em=new Emp();
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		Criteria c=ss.createCriteria(Emp.class);
		List<Emp> eldata=c.list();
		request.setAttribute("empdata", eldata);
		RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


	private void regEmployee(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("ename");		
		int salary=Integer.parseInt(request.getParameter("esalary"));
		Emp em=new Emp(name,salary);
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		ss.save(em);
		t.commit();
		ss.close();
		request.setAttribute("empinsert","Emp is Added SuccessFully");
		RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	private void loginAdmin(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("aemail");
		String password=request.getParameter("apassword");
		boolean login=false;
		Admin ad=new Admin(email,password);
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		Criteria c=ss.createCriteria(Admin.class);
		List<Admin> al=c.list();
		Criteria c1=ss.createCriteria(Emp.class);
		List<Emp> e=c1.list();;
		for(Admin a:al)
		{
			if(email.equals(a.getEmail())&&password.equals(a.getPassword()))
			{
				login=true;
				break;
			}
		}
		if(login)
		{
			request.setAttribute("empdata", e);
			RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		else
		{
			request.setAttribute("result","Email or password is incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
			try {
				rd.forward(request,response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		}
		
	}


	private void adminReg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name=request.getParameter("aname");
		String email=request.getParameter("aemail");
	    String password=request.getParameter("apassword");
	   // boolean b=false;
		Admin ad=new Admin(name,email,password);
		boolean insert=true;
		Configuration con=new Configuration();
		con.configure();
		SessionFactory sf=con.buildSessionFactory();
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		Criteria c=ss.createCriteria(Admin.class);
		List<Admin> al=c.list();
		for(Admin a:al)
		{
			if(email.equals(a.getEmail()))
			{
				insert=false;
				break;
			}
		}
		if(insert)
		{
			
			ss.save(ad);
			t.commit();
			response.sendRedirect("adminlogin.jsp");
		//	ss.close();
		}
		else
		{
			request.setAttribute("insert","Email is existed");
			RequestDispatcher rd=request.getRequestDispatcher("adminreg.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
