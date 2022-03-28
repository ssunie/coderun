package com.coderun.jsp.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.coderun.jsp.member.model.dto.ImageDTO;
import com.coderun.jsp.member.model.dto.MemberDTO;
import com.coderun.jsp.member.model.service.ImageService;

@WebServlet("/profileImg/insert")
public class MemberImageInsert extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String fileUploadDirectory = rootLocation + "/resources/upload/original/";
			
			File directory = new File(fileUploadDirectory);
			
			if(!directory.exists()) {
				directory.mkdirs();
			}
			
			
			ImageDTO image = new ImageDTO();
			image.setMemberId(((MemberDTO)request.getSession().getAttribute("loginMember")).getId());

			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(new File(fileUploadDirectory));
			fileItemFactory.setSizeThreshold(maxFileSize);
			
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
			
			try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				FileItem item = fileItems.get(0);
					
				if(!item.isFormField()) {
					if(item.getSize() > 0) {
						String filedName = item.getFieldName();
						String originFileName = item.getName();
							
						int dot = originFileName.lastIndexOf(".");
						String ext = originFileName.substring(dot);
							
						String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;
							
						File storeFile = new File(fileUploadDirectory + "/" + randomFileName);
							
						item.write(storeFile);
						
						image.setOrigin(originFileName);
						image.setEdit(randomFileName);
						image.setRoot("/resources/upload/original");
						
						}
					}
					
					String editName = new ImageService().modifyProfile(image);
					
					if(!editName.equals("new")) {
						File deleteFile = new File(fileUploadDirectory + "/" + editName);
						deleteFile.delete();
					}
					String path = "";
					if(editName != null) {
						((MemberDTO)request.getSession().getAttribute("loginMember")).setImage(image);
//						request.getRequestDispatcher("/WEB-INF/views/member/modify.jsp");
						response.sendRedirect(request.getContextPath());
//						path = "/WEB-INF/views/member/modify.jsp";
					}
//					request.getRequestDispatcher(path).forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
	}

}
