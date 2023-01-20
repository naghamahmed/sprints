
from datetime import date
import csv

def insert():
    Name = str(input("Enter your Name: "))
    Email = str(input("Enter your email address: "))
    Phone_Numbers= []
    number= input("Enter your phone number: ")
    while (number.upper() != "NO" or number.lower() != "no"):
        Phone_Numbers.append(number)
        number= input("Add another Number (Enter (no/NO) to exit):")
    Address = str(input("Enter your address: "))
    Insertion_Date = (date.today()).strftime("%d/%m/%Y")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([Name , Email , Phone_Numbers , Address , Insertion_Date])


def delete():
    rows=[]
    Name = input("Enter the user name: ")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        for line in csv_reader:
            if line[0] == Name:
                continue
            else:
                rows.append(line)
    with open(filename, 'w', newline='') as update:
        csv_writer = csv.writer(update)
        csv_writer.writerows(rows)

def update():
    rows=[]
    Name = input("Enter the user name which you want to change: ")
    old_record = input("which record you want to change (Name , Email , Phone_Numbers , Address):")
    new_record = input("Enter the new record:")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        for line in csv_reader:
            if line[0] == Name:
                if old_record == "Name":
                    line[0] = new_record
                elif old_record == "Email":
                    line[1] = new_record
                elif old_record == "Phone_Numbers":
                    line[2] = new_record
                elif old_record == "Address":
                    line[3] = new_record
            rows.append(line)

    with open(filename, 'w', newline='') as update:
        csv_writer = csv.writer(update)
        csv_writer.writerows(rows)


def show_menu():
    print("\n \n Please Choose an option (enter q to exit)")
    print("1- Insert Record")
    print("2- Delete Record")
    print("3- Update Record")