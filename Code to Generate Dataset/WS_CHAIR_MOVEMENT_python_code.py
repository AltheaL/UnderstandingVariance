# Variable Initialisation
loop_times = 602 # Number of frames + 1, has to be multiples of 4 then add 2
counter = 2 # Start at two, one is manually created

movement_initial = 0
movement_counter = 0.1

posCounter1 = 1
posCounter2 = 1
negCounter1 = 1
negCounter2 = 1

posValue1 = 0
posValue2 = 0
negValue1 = 0
negValue2 = 0

with open("movement_output.txt", "w") as text_file:
    # Frame 1, no movement applied
    print("#if(frame_number=1)", file=text_file)
    print("object { WindsorChair", file=text_file)
    print("    translate <0,0,0>", file=text_file)
    print("}", file=text_file)
    print("#end", file=text_file)


    while (counter != loop_times):
        print("#if(frame_number=",counter,")", file=text_file)
        print("object { WindsorChair", file=text_file)
        if (counter % 4 == 2):
            # Positive (1) Magnitude
            posValue1 = movement_initial + movement_counter * posCounter1
            print("    translate <",end = '', file=text_file)
            print("{0:.3f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue1),",",end = '', file=text_file)
            print("0",end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter1 += 1
        if (counter % 4 == 3):
            # Negative (1) Magnitude
            negValue1 = movement_initial - movement_counter * negCounter1
            print("    translate <",end = '', file=text_file)
            print("{0:.3f}".format(negValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue1),",",end = '', file=text_file)
            print("0",end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter1 += 1
        if (counter % 4 == 0):
            # Positive (2) Magnitude
            posValue2 = movement_initial + movement_counter * posCounter2
            print("    translate <",end = '', file=text_file)
            print("{0:.3f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue1),",",end = '', file=text_file)
            print("0",end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter2 += 1
        if (counter % 4 == 1):
            # Negative (2) Magnitude
            negValue2 = movement_initial - movement_counter * negCounter2
            print("    translate <",end = '', file=text_file)
            print("{0:.3f}".format(negValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue1),",",end = '', file=text_file)
            print("0",end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter2 += 1

        print("}", file=text_file)
        print("#end", file=text_file)
        counter += 1
            
print("Output File Generated")
print("Times looped:",counter-1)
print("Last posValue1:","{0:.3f}".format(posValue1))
print("Last posValue2:","{0:.3f}".format(posValue2))
print("Last negValue1:","{0:.3f}".format(negValue1))
print("Last negValue2:","{0:.3f}".format(negValue2))
