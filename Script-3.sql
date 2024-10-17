select ("FirstName"|| ' ' ||"LastName") as "RunnerName", date_part('year', age(current_date, "DateOfBirth")) as "Age", "Gender", row_number() over (partition by e."EventId"order by "RaceTime") AS "Position", row_number() over (partition by e."EventId", g."Gender" order by "RaceTime") AS "PositionGender", (("RaceTime" / 60 / 60)::text || 'h ' || (("RaceTime" / 60 % 60)::text || 'min ' ||  ("RaceTime" % 60)::text || 'sec')) as "RaceTime", "MarathonName", "EventName"
from "Marathon" m 
join "Event" e on "e"."MarathonId" = "m"."MarathonId"
join "RegistrationEvent" re on "re"."EventId" = "e"."EventId" 
join "Registration" r on "r"."RegistrationId" = "re"."RegistrationId" 
join "Runner" ru on "ru"."RunnerId" = "r"."RunnerId"
join "User" u on "u"."Email" = "ru"."Email"
join "Gender" g on "g"."Gender" = "ru"."GenderId"
where "RaceTime" is not null and "RaceTime"!=0
order by e."EventId", "Gender", "Position";