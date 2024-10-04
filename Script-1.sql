select "User"."FirstName", "User"."LastName",  "Runner"."CountryCode"  from "Runner" 
left join "Country" on "Runner"."CountryCode"="Country"."CountryName" 
join "User" on "Runner"."Email"="User"."Email";