import project

while (True):
    # show the menu
    project.show_menu()
    choice = input("Your Choice :")
    match choice:
        case '1':
            project.insert()
        case '2':
            project.delete()
        case '3':
            project.update()
        case 'q':
            exit()
        case _:
            print('Please Enter A valid input\n')