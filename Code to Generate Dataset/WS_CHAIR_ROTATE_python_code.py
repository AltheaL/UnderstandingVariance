# Variable Initialisation
loop_times = 722 # Number of frames + 1, has to be multiples of 4 then add 2
counter = 2 # Start at two, one is manually created

scale_initial = 0
scale_counter = 3

posCounter1 = 1
posCounter2 = 1
posCounter3 = 1
negCounter1 = 1
negCounter2 = 1
negCounter3 = 1

posValue1 = 0
posValue2 = 0
posValue3 = 0
negValue1 = 0
negValue2 = 0
negValue3 = 0

with open("rotate_output.txt", "w") as text_file:
    # Frame 1, no scaling applied
    print("#if(frame_number=1)", file=text_file)
    print("object { WindsorChair", file=text_file)
    print("    rotate <0,0,0>", file=text_file)
    print("}", file=text_file)
    print("#end", file=text_file)


    while (counter != loop_times):
        print("#if(frame_number=",counter,")", file=text_file)
        print("object { WindsorChair", file=text_file)
        if (counter % 6 == 2):
            # Positive (1) Magnitude
            posValue1 = scale_initial + scale_counter * posCounter1
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter1 += 1
        if (counter % 6 == 3):
            # Negative (1) Magnitude
            negValue1 = scale_initial - scale_counter * negCounter1
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(negValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter1 += 1
        if (counter % 6 == 4):
            # Positive (2) Magnitude
            posValue2 = scale_initial + scale_counter * posCounter2
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter2 += 1
        if (counter % 6 == 5):
            # Negative (2) Magnitude
            negValue2 = scale_initial - scale_counter * negCounter2
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(negValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter2 += 1
        if (counter % 6 == 0):
            # Positive (3) Magnitude
            posValue3 = scale_initial + scale_counter * posCounter3
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter3 += 1
        if (counter % 6 == 1):
            # Negative (3) Magnitude
            negValue3 = scale_initial - scale_counter * negCounter3
            print("    rotate <",end = '', file=text_file)
            print("{0:.3f}".format(negValue3),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue2),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue1),end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter3 += 1
        print("}", file=text_file)
        print("#end", file=text_file)
        counter += 1
            
print("Output File Generated")
print("Times looped:",counter-1)
print("Last posValue1:","{0:.3f}".format(posValue1))
print("Last posValue2:","{0:.3f}".format(posValue2))
print("Last posValue3:","{0:.3f}".format(posValue3))
print("Last negValue1:","{0:.3f}".format(negValue1))
print("Last negValue2:","{0:.3f}".format(negValue2))
print("Last negValue3:","{0:.3f}".format(negValue3))
