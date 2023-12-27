
class Airport {
  final String name;
  final String location;

  Airport(this.name, this.location);
}

class Airline {
  final String name;
  final String AirlineCode;

  Airline(this.name, this.AirlineCode);
}
class Aircraft{
   final int AircraftID;
   final String AircraftType;

  var AirlineCode;

  Aircraft(this.AircraftID ,this.AircraftType,this.AirlineCode);
}
class Flight{
 final String DepartureAirportCode;
 final String DestinationAirportCode;
    final String FlightNumber;
    late final String DepartureTime;
    final String ArrivalTime ;
    final String AircraftID;

  Flight(this.DepartureAirportCode, this.DestinationAirportCode, this.ArrivalTime, this.AircraftID,this.FlightNumber);

}
class Passenger{
   final String PassengerID;
   final String FirstName;
       final String LastName;

  Passenger(this.PassengerID, this.FirstName, this.LastName);
}
class SecurityCheck{
  final String CheckID;
  final String StaffID;
  final String FlightNumber;
  final String CheckTime;

  SecurityCheck(this.CheckID, this.StaffID, this.FlightNumber, this.CheckTime);


}
class Staff{
  final String StaffID;
  final String FirstName;
  final String LastName;
  final String Position;

  Staff(this.StaffID, this.FirstName, this.LastName, this.Position);
}
class Ticket{
  final String FlightNumber;
  final String PassengerID;
  final String TicketNumber;
  final String SeatNumber;

  Ticket(this.FlightNumber, this.PassengerID, this.TicketNumber, this.SeatNumber);

}
