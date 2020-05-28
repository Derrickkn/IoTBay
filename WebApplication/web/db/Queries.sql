
/* Query For Selecting A User's ID given a specified email and password */
select userid, email, password from unregistereduser_table natural join registereduser_table 
    where upper(email) = upper('email') and password = 'password';

