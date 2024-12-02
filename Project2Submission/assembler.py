#Name: Michael Buzzetta and Owen Krupa
#Pledge: I pledge my honor that I have abided by the Stevens Honor System.
#recieved help from CA and Tutor

dictionary= {
    'LDR': '0111111',
    'STR': '0000010',
    'MOV': '0001100',
    'ADD': '0000100',
    'SUB': '0000101',
    'MUL': '0000110',
    'DIV': '0000111',
}

def make(string):
    if(string == 'X0'):
        return '00'
    elif(string == 'X1'):
        return '01'
    elif(string == 'X2'):
        return '02'
    elif(string == 'X3'):
        return '03'


def assembler():
    #File being converted to an image file
    file = 'instructions.txt'

    
    #Reads from file
    with open(file, 'r') as file:
        read = file.readline()
        results = []
        binar = ''
        convert = ''
        #Ends reading at .end
        while(read != '' and read != 'END'):
            convert = ''
            #entry, *operands = read.split(' ')
            entry = (read.strip()).split(' ')
            for i in range(len(entry)):
                entry[i] = entry[i].strip(",")
            entry, *operands = entry
            
            if (entry == 'LDR'):
                convert += 17*"0"+dictionary['LDR'] # Append 17 '0's plus 7 LDR bits. 24 bits
                convert += 4*'0' # 28 bits
                #convert += make(operands[0]) + make(operands[1]) # 32 bits for operands 0 and 2
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar

            if (entry == 'STR'):
                convert += 17*"0"+dictionary['STR']
                convert += 4*'0'
                #convert += make(operands[0]) + make(operands[1])
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar
            
            if (entry == 'MOV'):
                convert += 17*"0"+dictionary['MOV']
                if(operands[1][0] == 'X'):
                    convert += 4*'0'
                    #convert += make(operands[0]) + make(operands[1])
                    binar = format(int(make(operands[0])), '02b')
                    convert += binar
                    binar = format(int(make(operands[1])), '02b')
                    convert += binar
                else:
                    if(int(operands[1]) < 16):
                        # GET MICHAEL OPINION!!!!
                        convert += format(int(operands[1]), '04b') # imm
                        #convert += make(operands[0]) + make(operands[1])
                        binar = format(int(make(operands[0])), '02b')
                        convert += binar # Reg1
                        #convert += format(int(make(operands[1]), 2), '02b') # ???
                        convert += 2*'0'
                    else:
                        raise Exception("Immediate out of bounds.")
            #Add operation
            if (entry == 'ADD'):
                convert += 17*"0"+dictionary['ADD']
                convert += 4*'0'
                #convert += make(operands[0]) + make(operands[1])
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar
            #Sub operation
            if (entry == 'SUB'):
                convert += 17*"0"+dictionary['SUB']
                convert += 4*'0'
                #convert += make(operands[0]) + make(operands[1])
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar
            #Mult operation
            if (entry == 'MUL'):
                convert += 17*"0"+dictionary['MUL']
                convert += 4*'0'
                #convert += make(operands[0]) + make(operands[1])
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar
                
            #Div operation
            if (entry == 'DIV'):
                convert += 17*"0"+dictionary['DIV']
                convert += 4*'0'
                #convert += make(operands[0]) + make(operands[1])
                binar = format(int(make(operands[0])), '02b')
                convert += binar
                binar = format(int(make(operands[1])), '02b')
                convert += binar

            if(convert != ''):
                convert = "{0:0>4x}".format(int(convert, 2))
                results.append(convert)
            
            read = file.readline()
    
    name = 'answer.txt'
    count = 0
    fileContent = ""
    resultsLen = len(results)
    #Writes to file
    while(count < 256):
        if(count % 16 == 0):
            fileContent += "\n{0:0>2x}:".format(count)
        if(count < resultsLen):
            fileContent += " " + results[count]
        else:
            fileContent += " 0000" 
        count += 1

    with open(name, 'w') as newFile:
        newFile.write(fileContent)

def main():
    assembler()


if __name__ == '__main__':
    main()
