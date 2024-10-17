select ("FirstName"|| ' ' ||"LastName") as "RunnerName", "Gender"."Gender",  date_part('year', age(current_date, "DateOfBirth")) as "Age", "RegistrationEvent"."RaceTime", "Event"."EventName" from "Runner"
join "Gender" on "Runner"."GenderId"="Gender"."Gender"
join "User" on "Runner"."Email"="User"."Email"
join "Registration" on "Runner"."RunnerId"="Registration"."RunnerId"
join "RegistrationEvent" on "RegistrationEvent"."RegistrationId"="Registration"."RegistrationId"
join "Event" on "RegistrationEvent"."EventId"="Event"."EventId"
where "RegistrationEvent"."RaceTime" is not null and "RegistrationEvent"."RaceTime" != 0
order by "RegistrationEvent"."RaceTime";