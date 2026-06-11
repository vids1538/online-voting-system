function nameCheck() {

    let fullname = document.getElementById("fullname").value;
        

    let error = document.getElementById("nameerror");
        

    let regex =  /^[A-Za-z ]{4,30}$/; // in this line there will be a space after 'z' if not then user can not give space in name field

    if(regex.test(fullname)) 
		{
			error.innerHTML = "valid name";
			error.style.color="green";
		}
    else {

        error.innerHTML =
        "must contain only letters ";
		error.style.color="red"; // if user will try to enter any digit or specail character then it will get this message in red color 
    }

}

function userCheck()
{
	let username = document.getElementById("username").value;
	
	let error = document.getElementById("usernameerror");
	
	let regex= /^[a-zA-Z0-9]{4,}$/
	
	if(regex.test(username))
		{
			error.innerHTML ="valid userame";
			error.style.color = "green";
			
		}
	else{
		error.innerHTML ="must contain only letters,numbers and no space allowed ";
		error.style.color="red";
	}
}

function ageCheck(){
	
     	let age = document.getElementById("age").value;

	    let error =  document.getElementById("ageerror");
	     
		// Converting string to number

	    age = Number(age);  

	    if(age >= 18 && age <= 120) {

	        error.innerHTML = "Valid Age";
			error.style.color="green";
	    }
	    else {

	        error.innerHTML =
	        "Age must be 18 or above.";

	        error.style.color = "red";
	    }

	}

	function mailCheck(){
		
	     	let mail = document.getElementById("mail").value;

		    let error =  document.getElementById("mailError");
		     
			let regex = /^[a-zA-Z0-9._]+@(gmail\.com|yahoo\.com|cimage\.in)$/; // this will allow  _ and .  before @

		    if(regex.test(mail)) {

		        error.innerHTML = "Valid email id ";
				error.style.color="green";
		    }
		    else {

		        error.innerHTML =  "E-mail is not valid, must contain @gmail.com";

		        error.style.color = "red";
		    }

		}
		
		function voterCheck()
		{
		    let voteridNum = document.getElementById("voter_number").value;

		    let error = document.getElementById("voterIdError");

		    let regex = /^[0-9]{8}$/;

		    if(regex.test(voteridNum))
		    {
		        error.innerHTML = "Valid Voter ID";
		        error.style.color = "green";
		    }
		    else
		    {
		        error.innerHTML = "Voter ID must contain exactly 8 digits.";
		        error.style.color = "red";
		    }
		}