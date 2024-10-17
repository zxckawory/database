select ("FirstName"|| ' ' ||"LastName") as "RunnerName", r."CountryCode"  from "Runner" r 
join "Country" c on r."CountryCode"=c."CountryCode" 
join "User" u on r."Email"=u."Email";