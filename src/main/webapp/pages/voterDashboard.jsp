<%-- Session Guard --%>
<%
    if (session.getAttribute("voter") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
        }
        
        .top-bar {
            background: #2c3e50;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        
        .logo {
            font-size: 18px;
            font-weight: bold;
        }
        
        .logout-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .logout-btn:hover {
            background: #c0392b;
        }
        
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            width: 250px;
            height: calc(100% - 60px);
            background: #34495e;
            padding-top: 20px;
        }
        
        .sidebar-item {
            padding: 12px 25px;
            color: #ecf0f1;
            cursor: pointer;
            display: block;
            text-decoration: none;
            transition: 0.3s;
        }
        
        .sidebar-item:hover {
            background: #2c3e50;
        }
        
        .sidebar-item.active {
            background: #3498db;
            color: white;
        }
        
        .sidebar-item i {
            margin-right: 10px;
            width: 20px;
        }
        
        .main-content {
            margin-left: 250px;
            margin-top: 60px;
            padding: 30px;
            min-height: calc(100vh - 60px);
        }
        
        .welcome-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        
        .welcome-text {
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .stats-container {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-box {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            flex: 1;
            text-align: center;
        }
        
        .stat-number {
            font-size: 32px;
            font-weight: bold;
            color: #3498db;
        }
        
        .stat-label {
            color: #7f8c8d;
            margin-top: 10px;
        }
        
        .status-voted {
            color: #27ae60;
            font-weight: bold;
        }
        
        .status-not-voted {
            color: #e74c3c;
            font-weight: bold;
        }
        
        .form-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 500px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 15px;
            display: block;
            border: 3px solid #3498db;
        }
        
        .btn-save {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        
        .btn-cancel {
            background: #95a5a6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .toast-message {
            position: fixed;
            top: 80px;
            right: 20px;
            background: #27ae60;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            z-index: 2000;
            display: none;
        }
        
        .toast-message.error {
            background: #e74c3c;
        }
        
        .hidden {
            display: none;
        }
        
        .upload-btn {
            background: #ecf0f1;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
            margin-top: 10px;
        }
        
        .upload-btn:hover {
            background: #bdc3c7;
        }
        
        /* Avatar with initials */
        .avatar-initials {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #3498db;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 16px;
            border: 2px solid white;
        }
        
        .profile-avatar-initials {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #3498db;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 36px;
            margin: 0 auto 15px;
            border: 3px solid #3498db;
        }
        
        /* Fix for image flickering */
        img {
            image-rendering: auto;
        }
        
        .nav-profile-container {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        
        .nav-profile-container img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid white;
        }
    </style>
</head>
<body>

<%
    String voterName = (String) session.getAttribute("voterName");
    String profilePicName = (String) session.getAttribute("profilePicture");
    String profilePicFullPath = "";
    
    // Get initials for fallback
    String initials = "";
    if (voterName != null && !voterName.isEmpty()) {
        String[] nameParts = voterName.trim().split(" ");
        if (nameParts.length >= 1) {
            initials += nameParts[0].charAt(0);
        }
        if (nameParts.length >= 2) {
            initials += nameParts[nameParts.length - 1].charAt(0);
        }
        initials = initials.toUpperCase();
    }
    
    // Check if profile picture exists and is not default
    if(profilePicName != null && !profilePicName.isEmpty() && !profilePicName.equals("default.png")) {
        profilePicFullPath = request.getContextPath() + "/uploads/user-profile/" + profilePicName;
    }
%>

<!-- Top Bar -->
<div class="top-bar">
    <div class="logo">🗳️ Election Commission</div>
    <div style="display: flex; align-items: center; gap: 15px;">
        <div class="nav-profile-container" onclick="showMyProfile(event)">
            <% if(profilePicFullPath.isEmpty()) { %>
                <div class="avatar-initials" id="navAvatarInitials"><%= initials %></div>
            <% } else { %>
                <img src="<%= profilePicFullPath %>" 
                     alt="Profile" 
                     id="navAvatarImg"
                     onerror="this.style.display='none'; document.getElementById('navAvatarInitials').style.display='flex';">
                <div class="avatar-initials" id="navAvatarInitials" style="display: none;"><%= initials %></div>
            <% } %>
            <span style="color: white; font-size: 14px;" id="navName"><%= voterName %></span>
        </div>
        <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout-btn">Logout</a>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <a href="#" class="sidebar-item active" onclick="showDashboard(event)">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>
    <a href="#" class="sidebar-item" onclick="showMyProfile(event)">
        <i class="bi bi-person"></i> My Profile
    </a>
    <a href="#" class="sidebar-item" onclick="showEditProfile(event)">
        <i class="bi bi-pencil-square"></i> Edit Profile
    </a>
    <a href="#" class="sidebar-item" onclick="showChangePassword(event)">
        <i class="bi bi-key"></i> Change Password
    </a>
    <a href="#" class="sidebar-item" onclick="showVotingBooth(event)">
        <i class="bi bi-check-circle"></i> Voting Booth
    </a>
    <a href="<%= request.getContextPath() %>/LogoutServlet" class="sidebar-item">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>
</div>

<!-- Main Content -->
<div class="main-content">
    
    <!-- Dashboard Section -->
    <div id="dashboardSection">
        <div class="welcome-card">
            <div class="welcome-text">
                Welcome <%= voterName %> 😊
            </div>
        </div>
        
        <div class="stats-container">
            <div class="stat-box">
                <div class="stat-number" id="totalCandidates">Loading...</div>
                <div class="stat-label">Total Candidates</div>
            </div>
            <div class="stat-box">
                <div class="stat-number" id="votingStatus">
                    <% if(session.getAttribute("hasVoted") != null && (Boolean)session.getAttribute("hasVoted")) { %>
                        <span class="status-voted">✓ Voted</span>
                    <% } else { %>
                        <span class="status-not-voted">✗ Not Voted</span>
                    <% } %>
                </div>
                <div class="stat-label">Your Voting Status</div>
            </div>
        </div>
    </div>
    
    <!-- My Profile Section -->
    <div id="profileSection" class="hidden">
        <div class="form-card">
            <h3 style="margin-bottom: 20px;">My Profile</h3>
            <% if(profilePicFullPath.isEmpty()) { %>
                <div class="profile-avatar-initials" id="profileViewInitials"><%= initials %></div>
            <% } else { %>
                <img src="<%= profilePicFullPath %>" 
                     class="profile-pic" 
                     id="profileViewImg"
                     onerror="this.style.display='none'; document.getElementById('profileViewInitials').style.display='flex';">
                <div class="profile-avatar-initials" id="profileViewInitials" style="display: none;"><%= initials %></div>
            <% } %>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control" id="profileName" value="<%= voterName %>" readonly>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" id="profileEmail" value="<%= session.getAttribute("voterEmail") %>" readonly>
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" id="profileUsername" value="<%= session.getAttribute("voter") %>" readonly>
            </div>
            <div class="form-group">
                <label>Voter Number</label>
                <input type="text" class="form-control" value="<%= session.getAttribute("voterNumber") %>" readonly>
            </div>
        </div>
    </div>
    
    <!-- Edit Profile Section -->
    <div id="editProfileSection" class="hidden">
        <div class="form-card">
            <h3 style="margin-bottom: 20px;">Edit Profile</h3>
            <form id="editProfileForm" enctype="multipart/form-data">
                <% if(profilePicFullPath.isEmpty()) { %>
                    <div class="profile-avatar-initials" id="editProfileInitials"><%= initials %></div>
                <% } else { %>
                    <img id="profilePreview" src="<%= profilePicFullPath %>"
                         class="profile-pic"
                         onerror="this.style.display='none'; document.getElementById('editProfileInitials').style.display='flex';">
                    <div class="profile-avatar-initials" id="editProfileInitials" style="display: none;"><%= initials %></div>
                <% } %>
                <div style="text-align: center;">
                    <label class="upload-btn">
                        📷 Upload Photo
                        <input type="file" name="profilePicture" accept="image/*" style="display: none" onchange="previewImage(this)">
                    </label>
                </div>
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName" class="form-control" value="<%= voterName %>" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" value="<%= session.getAttribute("voterEmail") %>" required>
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" value="<%= session.getAttribute("voter") %>" required>
                </div>
                <button type="button" class="btn-save" onclick="updateProfile()">Save Changes</button>
                <button type="button" class="btn-cancel" onclick="showMyProfile(event)">Cancel</button>
            </form>
        </div>
    </div>
    
    <!-- Change Password Section -->
    <div id="changePasswordSection" class="hidden">
        <div class="form-card">
            <h3 style="margin-bottom: 20px;">Change Password</h3>
            <form id="changePasswordForm">
                <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" name="currentPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" class="form-control" required>
                </div>
                <button type="button" class="btn-save" onclick="changePassword()">Update Password</button>
                <button type="button" class="btn-cancel" onclick="showDashboard(event)">Cancel</button>
            </form>
        </div>
    </div>
    
    <!-- Voting Booth Section -->
    <div id="votingSection" class="hidden">
        <div class="form-card">
            <h3 style="margin-bottom: 20px;">Voting Booth</h3>
            <% if(session.getAttribute("hasVoted") != null && (Boolean)session.getAttribute("hasVoted")) { %>
                <div style="text-align: center; padding: 40px;">
                    <div style="font-size: 48px;">✅</div>
                    <h4>You have already voted</h4>
                    <p>Thank you for participating!</p>
                </div>
            <% } else { %>
                <div id="candidatesList">
                    <p>Loading candidates...</p>
                </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Toast Message -->
<div id="toastMessage" class="toast-message"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let isLoading = false;
    
    // Function to get initials from full name
    function getInitials(fullName) {
        if (!fullName || fullName.trim() === '') return '';
        var nameParts = fullName.trim().split(' ');
        var initials = '';
        if (nameParts.length >= 1) {
            initials += nameParts[0].charAt(0);
        }
        if (nameParts.length >= 2) {
            initials += nameParts[nameParts.length - 1].charAt(0);
        }
        return initials.toUpperCase();
    }
    
    // Function to update all profile images
    function updateProfileImages(imageUrl, fullName) {
        var initials = getInitials(fullName);
        var timestamp = new Date().getTime();
        var fullImageUrl = imageUrl + '?t=' + timestamp;
        
        // Update Navbar
        var navImg = document.getElementById('navAvatarImg');
        var navInitials = document.getElementById('navAvatarInitials');
        if (imageUrl) {
            if (navImg) {
                navImg.src = fullImageUrl;
                navImg.style.display = 'block';
            }
            if (navInitials) {
                navInitials.style.display = 'none';
            }
        } else {
            if (navImg) {
                navImg.style.display = 'none';
            }
            if (navInitials) {
                navInitials.textContent = initials;
                navInitials.style.display = 'flex';
            }
        }
        
        // Update Profile View
        var profileImg = document.getElementById('profileViewImg');
        var profileInitials = document.getElementById('profileViewInitials');
        if (imageUrl) {
            if (profileImg) {
                profileImg.src = fullImageUrl;
                profileImg.style.display = 'block';
            }
            if (profileInitials) {
                profileInitials.style.display = 'none';
            }
        } else {
            if (profileImg) {
                profileImg.style.display = 'none';
            }
            if (profileInitials) {
                profileInitials.textContent = initials;
                profileInitials.style.display = 'flex';
            }
        }
        
        // Update Edit Profile Preview
        var editImg = document.getElementById('profilePreview');
        var editInitials = document.getElementById('editProfileInitials');
        if (imageUrl) {
            if (editImg) {
                editImg.src = fullImageUrl;
                editImg.style.display = 'block';
            }
            if (editInitials) {
                editInitials.style.display = 'none';
            }
        } else {
            if (editImg) {
                editImg.style.display = 'none';
            }
            if (editInitials) {
                editInitials.textContent = initials;
                editInitials.style.display = 'flex';
            }
        }
        
        // Update Navbar Name
        var navName = document.getElementById('navName');
        if (navName) {
            navName.textContent = fullName;
        }
        
        // Update Profile View Text Fields
        var profileName = document.getElementById('profileName');
        var profileEmail = document.getElementById('profileEmail');
        var profileUsername = document.getElementById('profileUsername');
        var editFullName = document.querySelector('input[name="fullName"]');
        var editEmail = document.querySelector('input[name="email"]');
        var editUsername = document.querySelector('input[name="username"]');
        
        if (profileName) profileName.value = fullName;
        if (editFullName) editFullName.value = fullName;
        
        // Get email and username from form
        var email = document.querySelector('input[name="email"]') ? document.querySelector('input[name="email"]').value : '';
        var username = document.querySelector('input[name="username"]') ? document.querySelector('input[name="username"]').value : '';
        
        if (profileEmail) profileEmail.value = email;
        if (profileUsername) profileUsername.value = username;
        if (editEmail) editEmail.value = email;
        if (editUsername) editUsername.value = username;
    }
    
    function loadTotalCandidates() {
        if(isLoading) return;
        isLoading = true;
        $.ajax({
            url: '<%= request.getContextPath() %>/GetTotalCandidatesServlet',
            method: 'GET',
            success: function(response) {
                $('#totalCandidates').text(response || '0');
                isLoading = false;
            },
            error: function() {
                $('#totalCandidates').text('0');
                isLoading = false;
            }
        });
    }
    
    function loadCandidates() {
        if(isLoading) return;
        isLoading = true;
        $('#candidatesList').html('<p>Loading candidates...</p>');
        $.ajax({
            url: '<%= request.getContextPath() %>/GetCandidatesServlet',
            method: 'GET',
            success: function(response) {
                $('#candidatesList').html(response);
                isLoading = false;
            },
            error: function() {
                $('#candidatesList').html('<p>Error loading candidates</p>');
                isLoading = false;
            }
        });
    }
    
    function showMessage(message, isError) {
        var toast = $('#toastMessage');
        toast.text(message);
        if(isError) {
            toast.addClass('error');
        } else {
            toast.removeClass('error');
        }
        toast.fadeIn();
        setTimeout(function() {
            toast.fadeOut();
        }, 3000);
    }
    
    function previewImage(input) {
        if(input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#profilePreview').attr('src', e.target.result);
                $('#profilePreview').show();
                $('#editProfileInitials').hide();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    // Updated updateProfile function
    function updateProfile() {
        var formData = new FormData($('#editProfileForm')[0]);
        
        $.ajax({
            url: '<%= request.getContextPath() %>/UpdateProfileServlet',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                if (response && response.startsWith('success')) {
                    showMessage('Profile updated successfully', false);
                    
                    // Get the new filename if provided
                    var parts = response.split(':');
                    var newFileName = parts.length > 1 ? parts[1].trim() : '';
                    
                    // Get full name from form
                    var fullName = document.querySelector('input[name="fullName"]').value;
                    
                    // Update images with new filename
                    if (newFileName && newFileName !== 'default.png') {
                        var imageUrl = '<%= request.getContextPath() %>/uploads/user-profile/' + newFileName;
                        updateProfileImages(imageUrl, fullName);
                    } else {
                        // No image uploaded, show initials
                        updateProfileImages(null, fullName);
                    }
                    
                } else {
                    showMessage('Error updating profile', true);
                }
            },
            error: function() {
                showMessage('Error updating profile', true);
            }
        });
    }
    
    function changePassword() {
        var currentPwd = $('input[name="currentPassword"]').val();
        var newPwd = $('input[name="newPassword"]').val();
        var confirmPwd = $('input[name="confirmPassword"]').val();
        
        if(newPwd !== confirmPwd) {
            showMessage('New passwords do not match', true);
            return;
        }
        
        $.ajax({
            url: '<%= request.getContextPath() %>/ChangePasswordServlet',
            method: 'POST',
            data: {
                currentPassword: currentPwd,
                newPassword: newPwd
            },
            success: function(response) {
                if(response === 'success') {
                    showMessage('Password updated successfully', false);
                    $('#changePasswordForm')[0].reset();
                } else if(response === 'incorrect') {
                    showMessage('Current password is incorrect', true);
                } else {
                    showMessage('Error updating password', true);
                }
            },
            error: function() {
                showMessage('Error updating password', true);
            }
        });
    }
    
    function castVote(candidateId) {
        if(confirm('Are you sure you want to vote for this candidate?')) {
            $.ajax({
                url: '<%= request.getContextPath() %>/CastVoteServlet',
                method: 'POST',
                data: { candidateId: candidateId },
                success: function(response) {
                    if(response === 'success') {
                        showMessage('Vote cast successfully', false);
                        setTimeout(function() {
                            location.reload();
                        }, 1500);
                    } else if(response === 'already_voted') {
                        showMessage('You have already voted', true);
                    } else {
                        showMessage('Error casting vote', true);
                    }
                },
                error: function() {
                    showMessage('Error casting vote', true);
                }
            });
        }
    }
    
    function showDashboard(event) {
        if(event) event.preventDefault();
        $('.sidebar-item').removeClass('active');
        $('.sidebar-item').eq(0).addClass('active');
        $('#dashboardSection').removeClass('hidden');
        $('#profileSection').addClass('hidden');
        $('#editProfileSection').addClass('hidden');
        $('#changePasswordSection').addClass('hidden');
        $('#votingSection').addClass('hidden');
        
        if($('#totalCandidates').text() === 'Loading...') {
            loadTotalCandidates();
        }
    }
    
    function showMyProfile(event) {
        if(event) event.preventDefault();
        $('.sidebar-item').removeClass('active');
        $('.sidebar-item').eq(1).addClass('active');
        $('#dashboardSection').addClass('hidden');
        $('#profileSection').removeClass('hidden');
        $('#editProfileSection').addClass('hidden');
        $('#changePasswordSection').addClass('hidden');
        $('#votingSection').addClass('hidden');
    }
    
    function showEditProfile(event) {
        if(event) event.preventDefault();
        $('.sidebar-item').removeClass('active');
        $('.sidebar-item').eq(2).addClass('active');
        $('#dashboardSection').addClass('hidden');
        $('#profileSection').addClass('hidden');
        $('#editProfileSection').removeClass('hidden');
        $('#changePasswordSection').addClass('hidden');
        $('#votingSection').addClass('hidden');
    }
    
    function showChangePassword(event) {
        if(event) event.preventDefault();
        $('.sidebar-item').removeClass('active');
        $('.sidebar-item').eq(3).addClass('active');
        $('#dashboardSection').addClass('hidden');
        $('#profileSection').addClass('hidden');
        $('#editProfileSection').addClass('hidden');
        $('#changePasswordSection').removeClass('hidden');
        $('#votingSection').addClass('hidden');
    }
    
    function showVotingBooth(event) {
        if(event) event.preventDefault();
        $('.sidebar-item').removeClass('active');
        $('.sidebar-item').eq(4).addClass('active');
        $('#dashboardSection').addClass('hidden');
        $('#profileSection').addClass('hidden');
        $('#editProfileSection').addClass('hidden');
        $('#changePasswordSection').addClass('hidden');
        $('#votingSection').removeClass('hidden');
        loadCandidates();
    }
    
    $(document).ready(function() {
        loadTotalCandidates();
    });
</script>
</body>
</html>