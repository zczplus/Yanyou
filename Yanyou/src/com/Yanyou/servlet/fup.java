package com.Yanyou.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Yanyou.entity.User;
import com.Yanyou.util.DB;

@WebServlet("/fup")
public class fup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public fup() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();

			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					System.out.println(item.getFieldName());
					System.out.println(item.getString());
					System.out.println(item.getName());
				} else {
					System.out.println("file upload in process ...");
					String name = item.getName();
					String[] part = name.split("\\.");
					String tail = part[part.length - 1];

					Date date = new Date();
					SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.hh.mm.ss");
					String currentTime = format.format(date);

					String src = this.getServletContext().getRealPath("") + "images\\avatar\\" + currentTime + "." + tail;
					String srcc = currentTime + "." + tail;
					user.setAvatar(srcc);
					System.out.println(user.getAvatar());

					DB db = new DB();
					db.updateAvatar(user.getName(), user.getAvatar());

					File upLoadedFile = new File(src);
					try {
						item.write(upLoadedFile);
					} catch (Exception e) {
						// TODO 自动生成的 catch 块
						e.printStackTrace();
					}
				}
			}
		} catch (FileUploadException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		request.getRequestDispatcher("Personal.jsp").forward(request, response);
	}

}
