#Name: Michael Buzzetta
#Pledge: I pledge my honor that I have abided by the Stevens Honor System.

def assembler():
    #File being converted to an image file
    file = 'instructions.s'

    #Reads from file
    with open(file, 'r') as file:
        read = file.readline()
        result = []
        convert = 0
        #Ends reading at .end 
        while(read != '' and read != 'FIN'):
            entry = read[0:3]
            if (entry == 'LDR' or entry == 'ldr' or entry == 'Ldr' or entry == 'LDr' or entry == 'lDR' or entry == 'LdR' or entry == 'ldR'):
                convert = (int(read[4:6])) << 2
                convert += (int(read[8]))
                #Adds a 0 to the hex conversion if it's just one nibble and makes it two nibbles
                if len(hex(convert)[2:4]) == 1:
                    result.append('0' + hex(convert)[2:4])
                else:
                    result.append(hex(convert)[2:4])
            #Add operation
            if (entry == 'ADD' or entry == 'add' or entry == 'Add' or entry == 'ADd' or entry == 'aDD' or entry == 'AdD' or entry == "adD"):
                convert = 64
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            #Sub operation
            if (entry == 'SUB' or entry == 'sub' or entry == 'Sub' or entry == 'SUb' or entry == 'sUB' or entry == 'SuB' or entry == 'suB'):
                convert = 128
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            #Mult operation
            if (entry == 'MUL' or entry == 'mul' or entry == 'Mul' or entry == 'MUl' or entry == 'mUL' or entry == 'MuL' or entry == 'muL'):
                convert = 192
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            #Div operation
            if(entry == 'DIV' or entry == 'div' or entry == 'Div' or entry == 'DIv' or entry == 'dIV' or entry == 'MuL' or entry == 'diV'):
                convert=256
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            read = file.readline()
        file.close()
        print("ur mom")
    
    name = 'answer.txt'
    #Writes to file
    with open(name, 'w') as file:
        hexs = 0
        #Adds space between hex values
        while(hexs != len(result)):
            file.write(result[hexs] + ' ')
            hexs += 1
        file.close()

def main():
    assembler()
