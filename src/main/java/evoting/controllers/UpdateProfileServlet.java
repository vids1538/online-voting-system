package evoting.controllers;

import evoting.DbConnection.DbConnection;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1024 * 10
)
public class UpdateProfileServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer voterId = (Integer) session.getAttribute("voterId");
        
        if(voterId == null) {
            response.getWriter().write("error:Session expired");
            return;
        }
        
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        
        // Validate inputs
        if(fullName == null || fullName.trim().isEmpty() || 
           email == null || email.trim().isEmpty() || 
           username == null || username.trim().isEmpty()) {
            response.getWriter().write("error:All fields are required");
            return;
        }
        
        String newFileName = null;
        String oldFileName = (String) session.getAttribute("profilePicture");
        
        // Handle file upload
        Part filePart = request.getPart("profilePicture");
        if(filePart != null && filePart.getSize() > 0) {
            // Extract first name from full name
            String firstName = fullName.trim().split(" ")[0].toLowerCase();
            newFileName = firstName + ".png";
            
            // Save to permanent folder
            String uploadPath = getServletContext().getRealPath("/uploads/user-profile");
            if(uploadPath == null) {
                // Fallback if getRealPath returns null (in some containers)
                uploadPath = "C:\\Users\\sagar\\eclipse-workspace\\E-voting\\src\\main\\webapp\\uploads\\user-profile";
            }
            
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            // Save file (overwrites existing file with same name)
            String fullSavePath = uploadPath + File.separator + newFileName;
            filePart.write(fullSavePath);
            
            System.out.println("File saved: " + fullSavePath);
            
            // Delete old file if it exists and is different from new file
            if(oldFileName != null && !oldFileName.equals(newFileName) && !oldFileName.equals("default.png")) {
                File oldFile = new File(uploadPath + File.separator + oldFileName);
                if(oldFile.exists()) {
                    oldFile.delete();
                    System.out.println("Old file deleted: " + oldFileName);
                }
            }
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DbConnection.getConnection();
            
            String query;
            if(newFileName != null) {
                // Update with new profile picture
                query = "UPDATE voters SET full_name=?, email=?, username=?, profile_picture=? WHERE voter_id=?";
                ps = conn.prepareStatement(query);
                ps.setString(1, fullName);
                ps.setString(2, email);
                ps.setString(3, username);
                ps.setString(4, newFileName);
                ps.setInt(5, voterId);
            } else {
                // Update without changing profile picture
                query = "UPDATE voters SET full_name=?, email=?, username=? WHERE voter_id=?";
                ps = conn.prepareStatement(query);
                ps.setString(1, fullName);
                ps.setString(2, email);
                ps.setString(3, username);
                ps.setInt(4, voterId);
            }
            
            int updated = ps.executeUpdate();
            
            if(updated > 0) {
                // Update session with new values
                session.setAttribute("voterName", fullName);
                session.setAttribute("voterEmail", email);
                session.setAttribute("voter", username);
                
                // Update session with new filename if uploaded
                if(newFileName != null) {
                    session.setAttribute("profilePicture", newFileName);
                }
                
                // Return success with filename if new image uploaded
                if(newFileName != null) {
                    response.getWriter().write("success:" + newFileName);
                } else {
                    response.getWriter().write("success");
                }
            } else {
                response.getWriter().write("error:Database update failed");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().write("error:" + e.getMessage());
        } finally {
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}