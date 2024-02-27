SELECT * FROM cd.bookings
SELECT * FROM cd.facilities
SELECT * FROM cd.members

--2)
SELECT name,membercost FROM cd.facilities
WHERE membercost > 0;


--4)
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost>0 AND membercost < (monthlymaintenance/50.0)

--5)
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%'

--6)
SELECT * FROM cd.facilities
WHERE facid IN(1,5)

--7)
SELECT memid, surname, firstname, joindate FROM cd.members
WHERE joindate >= '2012-09-01'

--8)
SELECT DISTINCT(surname) FROM cd.members
ORDER BY surname 
LIMIT 10

--9)
SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1

--10)
SELECT count(guestcost) FROM cd.facilities
WHERE guestcost >= 10

--11)
SELECT * FROM cd.bookings

SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid ORDER BY SUM(slots)

--12)
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
GROUP BY facid 
HAVING SUM(slots) > 1000
ORDER BY facid;

--13)
SELECT starttime as start, name FROM cd.bookings 
INNER JOIN cd.facilities
ON cd.facilities.facid = cd.bookings.facid
WHERE starttime == '2012-09-21' AND cd.facilities.name IN ('Tennis Court 1','Tennis Court 2') 

