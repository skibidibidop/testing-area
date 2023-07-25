#|
Author: Mark Beltran
Date: July 25, 2023

Exercise 104. Your home town manages a fleet of vehicles: automobiles,
vans, buses, and SUVs. Develop a data representation for vehicles. The
representation of each vehicle must describe the number of passengers that
it can carry, its license plate number, and its fuel consumption (miles per
gallon). Develop a template for functions that consume vehicles.
|#

; DATA DEFINITION //////////////////////////////////////////////////////////////

(define-struct vehicle [seats, plate, fuel_cons])
; (make-vehicle Seat_limit String Fuel_consumption)
; Interp.: (make-vehicle pass, lp, c) represents a vehicle's
; maximum number of passengers (pass), license plate number (lp),
; and fuel consumption (lp) in miles per gallon

; A Seat_limit is a PositiveInteger
; Interp.: the maximum number of passengers

; A Fuel_consumption is a Number
; Interp.: a vehicle's fuel consumption in miles per gallon

; FUNCTIONS ////////////////////////////////////////////////////////////////////

; Vehicle -> ???
; Template for a function that consumes Vehicles
(define (fn_for_vehicles v)
  (...(vehicle-seats v)...
      (vehcile-plate v)...
      (vehicle-fuel_cons v)...))
