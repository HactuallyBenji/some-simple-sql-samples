USE hotelSoftwareGuild;

/*
Write a query that returns a list of reservations that end in July 2023, 
including the name of the guest, the room number(s), and the reservation dates.
*/
SELECT 
	Reservations.reservationID AS "Reservation ID",
    Reservations.roomNumber AS "Room Number",
    Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out" 
FROM Reservations 
JOIN Guests ON Guests.guestID = Reservations.guestID
WHERE endDate BETWEEN "2023-07-01" AND "2023-08-01";

/*
Write a query that returns a list of all reservations for rooms with a jacuzzi,
displaying the guest's name, the room number, and the dates of the reservation.
*/
SELECT
	Reservations.reservationID AS "Reservation ID",
    Amenities.amenityType AS "Amenity",
    Reservations.roomNumber AS "Room Number",
    Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out"
FROM Reservations
JOIN RoomsToAmenities
ON RoomsToAmenities.roomNumber = Reservations.roomNumber
JOIN Amenities 
ON RoomsToAmenities.amenityID = Amenities.amenityID
JOIN Guests
ON Guests.guestID = Reservations.guestID
WHERE RoomsToAmenities.amenityID = 4;

/*
Write a query that returns all the rooms reserved for a specific guest,
including the guest's name, the room(s) reserved,
the starting date of the reservation,
and how many people were included in the reservation.
(Choose a guest's name from the existing data.)
Bettyann Seery was selected in this case
*/
SELECT
	Reservations.reservationID AS "Reservation ID",
	Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.roomNumber AS "Reserved Room Number",
    Reservations.startDate AS "Check In Date",
    Reservations.adults + Reservations.children AS "Number of People"
FROM Reservations
JOIN Guests
ON Guests.guestID = Reservations.guestID
WHERE Guests.firstName = "Bettyann" AND Guests.lastName = "Seery";

/*
Write a query that returns a list of rooms,
reservation ID, and per-room cost for each reservation.
The results should include all rooms,
whether or not there is a reservation associated with the room.
*/
SELECT  
	Rooms.roomNumber AS "Room Number",
	Reservations.reservationID AS "Reservation ID",
	Rooms.basePrice AS "Room Base Price",
	Reservations.cost AS "Reservation Cost For Room"
FROM Rooms LEFT JOIN Reservations ON Rooms.roomNumber = Reservations.roomNumber;


/*
Write a query that returns all the rooms accommodating 
at least three guests and that are reserved on any date in April 2023.
*/


/*
Write a query that returns a list of all guest names and the 
number of reservations per guest, sorted starting with the 
guest with the most reservations and then by the guest's last name.
*/

/*
Write a query that displays the name, address, and phone number 
of a guest based on their phone number. (Choose a phone number from the existing data.)
*/


