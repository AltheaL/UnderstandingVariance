# Variable Initialisation
loop_times = 2000 # Number of frames + 1, has to be multiples of 4 then add 2
counter = 2 # Start at two, one is manually created

colour_initial = 0
colour_counter = 0.01

posCounter1 = 1
posCounter2 = 1
posCounter3 = 1

posValue1 = 0
posValue2 = 0
posValue3 = 0

overflowCounter = 1
counterThreshold = 1/colour_counter + 1
print("Counter Threshold: ", counterThreshold) 

with open("colour_output.txt", "w") as text_file:
    # Frame 1, no colour applied
    print("#if(frame_number=1)", file=text_file)
    print("#declare chair_wood_x = texture { pigment { colour rgb <0.00,0.00,0.00> } }", file=text_file)
    print("#declare chair_wood_y = texture { pigment { colour rgb <0.00,0.00,0.00> } }", file=text_file)
    print("#declare chair_wood_z = texture { pigment { colour rgb <0.00,0.00,0.00> } }", file=text_file)
    print("#end", file=text_file)


    while (counter != loop_times):

        if (overflowCounter == 8):
            break
        
        print("#if(frame_number=",counter,")", file=text_file)
        if (overflowCounter == 1):
            # 001
            posValue1 = colour_initial + colour_counter * posCounter1
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter1 += 1
            
            if (posCounter1 == counterThreshold):
                overflowCounter += 1
                posValue1 = 0
                posCounter1 = 0
            
        elif (overflowCounter == 2):
            # 010
            posValue2 = colour_initial + colour_counter * posCounter2
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter2 += 1

            if (posCounter2 == counterThreshold):
                overflowCounter += 1
            
        elif (overflowCounter == 3):
            # 011
            posValue1 = colour_initial + colour_counter * posCounter1
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter1 += 1

            if (posCounter1 == counterThreshold):
                overflowCounter += 1
                posValue1 = 0
                posValue2 = 0
                posCounter1 = 0
                posCounter2 = 0

        elif (overflowCounter == 4):
            # 100
            posValue3 = colour_initial + colour_counter * posCounter3
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter3 += 1

            if (posCounter3 == counterThreshold):
                overflowCounter += 1               

        elif (overflowCounter == 5):
            # 101
            posValue1 = colour_initial + colour_counter * posCounter1
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter1 += 1

            if (posCounter1 == counterThreshold):
                overflowCounter += 1
                posValue1 = 0
                posCounter1 = 0 


        elif (overflowCounter == 6):
            # 110
            posValue2 = colour_initial + colour_counter * posCounter2
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter2 += 1

            if (posCounter2 == counterThreshold):
                overflowCounter += 1

        elif (overflowCounter == 7):
            # 111
            posValue1 = colour_initial + colour_counter * posCounter1
            
            print("#declare chair_wood_x = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_y = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)

            print("#declare chair_wood_z = texture { pigment { colour rgb <",end = '', file=text_file)
            print("{0:.2f}".format(posValue3),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue2),",",end = '', file=text_file)
            print("{0:.2f}".format(posValue1),end = '', file=text_file)
            print("> } }", file=text_file)
            posCounter1 += 1

            if (posCounter1 == counterThreshold):
                overflowCounter += 1

        print("#end", file=text_file)
        counter += 1
            
print("Output File Generated")
print("Times looped:",counter-1)
print("Last posValue1:","{0:.2f}".format(posValue1))
print("Last posValue2:","{0:.2f}".format(posValue2))
print("Last posValue3:","{0:.2f}".format(posValue3))
