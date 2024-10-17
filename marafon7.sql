select "Password", "DateOfBirth", date_part('year', age(current_date, "DateOfBirth")) as "Age" from "User" u 
join "Runner" r on r."Email" = u."Email" 
where "Password" similar to '%[a-z]%' and "Password" similar to '%[0-9]%' and "Password" similar to '%[:!@#$%^]%' and length("Password") >= 6 
and date_part('year', age(current_date, "DateOfBirth")) >= 10;
