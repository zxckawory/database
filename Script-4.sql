select ("FirstName"|| ' ' ||"LastName") as "RunnerName", 
"CountryName",
date_part('year', age(current_date, "DateOfBirth")) as "Age",
"Gender", "YearHeld",
row_number() over (partition by e."EventId"order by "RaceTime") AS "Position",
"RaceTime", 
(("RaceTime" / 60 / 60)::text || 'h ' || (("RaceTime" / 60 % 60)::text || 'min ' ||  ("RaceTime" % 60)::text || 'sec')) as "RaceTime",
"EventTypeName", "MarathonName"
from "Registration" r 
join "RegistrationEvent" re on re."RegistrationId" = r."RegistrationId"
join "Event" e on e."EventId" = re."EventId"
join "Runner" ru on ru."RunnerId" = r."RunnerId"
join "User" u on u."Email" = ru."Email"
join "Country" c on c."CountryCode" = ru."CountryCode"
join "Marathon" m on m."CountryCode" = c."CountryCode"
join "EventType" et on et."EventTypeId" = e."EventTypeId"
join "Gender" g on g."Gender" = ru."GenderId"
where "RaceTime" is not null and "RaceTime"!=0
order by e."EventId", "Gender", "Position";

select (round(avg("RaceTime") / 60 / 60, 2))::text || 'ч ' || (round(avg("RaceTime") / 60 % 60, 2))::text || 'мин ' ||  (round(avg("RaceTime") % 60, 2))::text || 'сек'  "AverageRaceTime",
count("RaceTime") "AmountOfRunner" from "RegistrationEvent" re 
where "RaceTime" is not null and "RaceTime"!=0;