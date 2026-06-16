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
        
        /* Fix for image flickering */
        img {
            image-rendering: auto;
        }
        
        
        
        
        /* Voting Booth - Simple Tiles */
.candidate-tile {
    border: 1px solid #e0e0e0;
    padding: 12px 18px;
    margin-bottom: 8px;
    border-radius: 6px;
    background: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: all 0.2s;
}

.candidate-tile:hover {
    border-color: #3498db;
    background: #f8f9fa;
}

.candidate-tile .info {
    display: flex;
    gap: 20px;
    align-items: center;
}

.candidate-tile .name {
    font-weight: 600;
    font-size: 15px;
    color: #2c3e50;
}

.candidate-tile .party {
    color: #7f8c8d;
    font-size: 13px;
}

.vote-btn-small {
    background: #3498db;
    color: white;
    border: none;
    padding: 5px 18px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 13px;
    font-weight: 500;
    transition: all 0.2s;
    min-width: 70px;
}

.vote-btn-small:hover:not(:disabled) {
    background: #2980b9;
}

.vote-btn-small:disabled {
    background: #bdc3c7;
    cursor: not-allowed;
}

.vote-btn-small.voted {
    background: #27ae60;
}

/* Already voted message */
.already-voted-box {
    text-align: center;
    padding: 40px 20px;
    background: white;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
}

.already-voted-box .icon {
    font-size: 48px;
    margin-bottom: 10px;
}

.already-voted-box .title {
    font-size: 20px;
    color: #27ae60;
    font-weight: 600;
}

.already-voted-box .sub {
    color: #7f8c8d;
    font-size: 14px;
    margin-top: 5px;
}

/* Loading */
.loading-text {
    text-align: center;
    padding: 30px;
    color: #7f8c8d;
}

/* No candidates */
.no-candidates {
    text-align: center;
    padding: 30px;
    color: #7f8c8d;
}
    </style>
</head>
<body>

<%
    String profilePicName = (String) session.getAttribute("profilePicture");
    String profilePicFullPath = "";
    if(profilePicName != null && !profilePicName.isEmpty() && !profilePicName.equals("default.png")) {
        profilePicFullPath = request.getContextPath() + "/uploads/user-profile/" + profilePicName;
    } else {
        // No default image - show nothing or a simple icon
        profilePicFullPath = "";
    }
%>

<!-- Top Bar -->
<div class="top-bar">
    <div class="logo">🗳️ Election Commission</div>
    <div style="display: flex; align-items: center; gap: 15px;">
        <div style="display: flex; align-items: center; gap: 10px; cursor: pointer;" onclick="showMyProfile(event)">
            <img src="<%= profilePicFullPath %>" 
                 alt="Profile" 
                 style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid white;"
                 onerror="this.src='<%= request.getContextPath() %>/uploads/user-profile/default.png'">
            <span style="color: white; font-size: 14px;"><%= session.getAttribute("voterName") %></span>
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
                Welcome <%= session.getAttribute("voterName") %> 😊
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
            <img src="<%= profilePicFullPath %>" 
                 class="profile-pic" 
                 onerror="this.src='<%= request.getContextPath() %>/uploads/user-profile/default.png'">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control" value="<%= session.getAttribute("voterName") %>" readonly>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" value="<%= session.getAttribute("voterEmail") %>" readonly>
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" value="<%= session.getAttribute("voter") %>" readonly>
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
            <img id="profilePreview" src="<%= profilePicFullPath %>"
                 class="profile-pic"
                 onerror="this.style.display='none'">
            <div style="text-align: center;">
                <label class="upload-btn">
                    📷 Upload Photo
                    <input type="file" name="profilePicture" accept="image/*" style="display: none" onchange="previewImage(this)">
                </label>
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" class="form-control" value="<%= session.getAttribute("voterName") %>" required>
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
    <!-- Heading outside the card -->
    <div style="margin-bottom: 25px;">
        <h2 style="color: #2c3e50; font-weight: 600; font-size: 28px;">🗳 Voting Booth</h2>
        <p style="color: #7f8c8d; margin-top: 5px; font-size: 14px;">Select your candidate wisely. Your vote is your voice!</p>
    </div>
    
    <!-- Loading -->
    <div id="votingLoading" style="text-align: center; padding: 30px;">
        <p>Loading candidates...</p>
    </div>
    
    <!-- Candidates container -->
    <div id="candidatesContainer" style="display: none;">
        <!-- Candidates loaded here -->
    </div>
</div>

<!-- Toast Message -->
<div id="toastMessage" class="toast-message"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let isLoading = false;
    
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
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    // FIXED: Update profile with page reload to show new image
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

                // Extract new filename from response e.g. "success:abc123.jpg"
                var parts = response.split(':');
                var newFileName = parts.length > 1 ? parts[1].trim() : '';

                if (newFileName && newFileName !== 'default.png') {
                    var newImgUrl = '<%= request.getContextPath() %>/uploads/user-profile/'
                                    + newFileName
                                    + '?t=' + new Date().getTime(); // cache-bust

                    // Update navbar avatar
                    $('#navAvatarImg').attr('src', newImgUrl).show();
                    $('#navAvatarInitial').hide();

                    // Update edit profile preview
                    $('#profilePreview').attr('src', newImgUrl).show();
                    
                    // Update my profile pic if it exists
                    $('#profileViewImg').attr('src', newImgUrl).show();
                }

                // Update text fields in My Profile view
                var newName = $('input[name="fullName"]').val();
                var newEmail = $('input[name="email"]').val();
                var newUsername = $('input[name="username"]').val();

                $('#profileName').val(newName);
                $('#profileEmail').val(newEmail);
                $('#profileUsername').val(newUsername);
                $('#navName').text(newName);

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
                        }, 3000);
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
    
    
    
    
 // Show voting booth
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

    // Load candidates
    function loadCandidates() {
        $('#votingLoading').show();
        $('#candidatesContainer').hide();
        
        $.ajax({
            url: '<%= request.getContextPath() %>/GetCandidatesServlet',
            method: 'GET',
            success: function(response) {
                $('#votingLoading').hide();
                $('#candidatesContainer').html(response);
                $('#candidatesContainer').show();
            },
            error: function() {
                $('#votingLoading').hide();
                $('#candidatesContainer').html('<p style="color: red; text-align: center;">Error loading candidates</p>');
                $('#candidatesContainer').show();
            }
        });
    }

    // Cast vote
    function castVote(candidateId, partyName) {
        if(confirm('Are you sure you want to vote for ' + partyName + ' party?')) {
            
            // Disable all vote buttons
            $('.vote-btn-small').prop('disabled', true).css('opacity', '0.6');
            
            $.ajax({
                url: '<%= request.getContextPath() %>/CastVoteServlet',
                method: 'POST',
                data: { candidateId: candidateId },
                success: function(response) {
                    if(response === 'success') {
                        showMessage('✅ Voted successfully!', false);
                        setTimeout(function() {
                            loadCandidates();
                        }, 1500);
                    } else if(response === 'already_voted') {
                        showMessage('You have already voted!', true);
                        loadCandidates();
                    } else {
                        showMessage('Error casting vote', true);
                        $('.vote-btn-small').prop('disabled', false).css('opacity', '1');
                    }
                },
                error: function() {
                    showMessage('Error casting vote', true);
                    $('.vote-btn-small').prop('disabled', false).css('opacity', '1');
                }
            });
        }
    }
    
    $(document).ready(function() {
        loadTotalCandidates();
    });
</script>
</body>
</html>