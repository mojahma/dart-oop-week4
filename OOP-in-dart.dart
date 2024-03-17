import 'dart:io';

// Interface definition
abstract class Vehicle {
  void drive();
}

// Base class
class Car implements Vehicle {
  @override
  void drive() {
    print('Car is driving.');
  }
}

// Derived class inheriting from Car
class ElectricCar extends Car {
  @override
  void drive() {
    print('Electric car is driving silently.');
  }
}

// Class that implements an interface
class Truck implements Vehicle {
  @override
  void drive() {
    print('Truck is driving.');
  }
}

// Class that initializes data from a file
class CarData {
  String brand;
  int year;

  CarData(this.brand, this.year);

  factory CarData.fromFile(File file) {
    try {
      List<String> lines = file.readAsLinesSync();
      String brand = lines[0];
      int year = int.parse(lines[1]);
      return CarData(brand, year);
    } catch (e) {
      print('Error reading file: $e');
      return CarData('', 0); // Return empty data in case of error
    }
  }
}

void main() {
  // Creating instances of classes
  Car myCar = Car();
  ElectricCar myElectricCar = ElectricCar();
  Truck myTruck = Truck();

  // Demonstrating method override
  myCar.drive(); // Output: Car is driving.
  myElectricCar.drive(); // Output: Electric car is driving silently.
  myTruck.drive(); // Output: Truck is driving.

  // Initializing data from a file
  File carFile = File('car_data.txt');
  CarData myCarData = CarData.fromFile(carFile);
  print('Car brand: ${myCarData.brand}, Year: ${myCarData.year}');

  // Demonstrating the use of a loop
  for (int i = 1; i <= 5; i++) {
    print('Loop iteration $i');
  }
  
}
