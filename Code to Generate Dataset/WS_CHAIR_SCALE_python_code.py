# Variable Initialisation
loop_times = 922 # Number of frames + 1
counter = 2 # Start at two, one is manually created

scale_initial = 1
scale_counter = 0.001

posCounter = 1
negCounter = 1

with open("scale_output.txt", "w") as text_file:
    # Frame 1, no scaling applied
    print("#if(frame_number=1)", file=text_file)
    print("object { WindsorChair", file=text_file)
    print("    scale <1,1,1>", file=text_file)
    print("}", file=text_file)
    print("#end", file=text_file)


    while (counter != loop_times):
        print("#if(frame_number=",counter,")", file=text_file)
        print("object { WindsorChair", file=text_file)
        if (counter % 2 == 0):
            # Positive Magnitude
            posValue = scale_initial + scale_counter * posCounter
            print("    scale <",end = '', file=text_file)
            print("{0:.3f}".format(posValue),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue),",",end = '', file=text_file)
            print("{0:.3f}".format(posValue),end = '', file=text_file)
            print(">",end = '', file=text_file)
            posCounter += 1
        if (counter % 2 == 1):
            # Negative Magnitude
            negValue = scale_initial - scale_counter * negCounter
            print("    scale <",end = '', file=text_file)
            print("{0:.3f}".format(negValue),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue),",",end = '', file=text_file)
            print("{0:.3f}".format(negValue),end = '', file=text_file)
            print(">",end = '', file=text_file)
            negCounter += 1
        print("}", file=text_file)
        print("#end", file=text_file)
        counter += 1
            
print("Output File Generated")
print("Times looped:",counter-1)
print("Last posValue:","{0:.3f}".format(posValue))
print("Last negValue:","{0:.3f}".format(negValue))
