select ("FirstName"|| ' ' ||"LastName") as "RunnerName", r."CountryCode"  from "Runner" r 
join "Country" c on r."CountryCode"=c."CountryCode" 
join "User" u on r."Email"=u."Email"
join "Registration" r2 on r2."RunnerId" = r."RunnerId" 
join "RegistrationEvent" re on re."RegistrationEventId" = r2."RegistrationId" 
join "Event" e on e."EventId" = re."EventId" 
join "Marathon" m on m."MarathonId" = e."MarathonId" 
where "YearHeld" = 2015;