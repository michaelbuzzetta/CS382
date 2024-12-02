def signedIntToBin(val: int, size: int):
    """turns a signed decimal into binary via two's complement and returns a string of size bits"""
    return bin(val if val>=0 else val+(1<<size))[2:]

def binToHex(bits: str):
    """converts a string of binary digits into hex and returns a string of hex digits"""
    return hex(int(bits, 2))[2:]

def regToBin(reg: str, bitsPerReg: int):
    """converts a register name into its n-bit binary encoding and returns a string"""
    bits = str(bin(int(reg[1:])))[2:]
    bits = '0'*(bitsPerReg-len(bits)) + bits
    return bits

def encode(instruction: str, mappings: dict, bitsPerReg: int, lineNum: int):
    """encodes an assembly isntruction into binary and returns a string"""
    instruction = instruction.replace(',', '') #getting rid of unnecessary characters
    instruction = instruction.replace('[', '')
    instruction = instruction.replace(']', '')
    inst = instruction.lower().split()
    format = mappings[inst[0]]
    encoding = ''
    encoding += format[0] #adds opcode
    argIndex = 1 
    # print(format)
    # print(inst)
    for operand in format[1:]: #iterates through all the operands in the instruction formal
        if('R' in operand):
            registerEncoding = regToBin(inst[argIndex], bitsPerReg)
            if(len(registerEncoding) > bitsPerReg):
                print("warning: register not found on line " + str(lineNum)+ ". Behavior undefined") 
            encoding += registerEncoding #encode the register
            argIndex += 1
        elif ('imm' in operand):
            #encode the immediate
            imm = inst[argIndex]
            if(imm[:2] == '0x'): #if the immediate number is hex, convert to int
                imm = int(imm, 16)
            elif(imm[:2] == '0b'): #if the immediate number is binary, convert to int
                imm = int(imm, 2)
            else: #immediate number must be decimal, convert to int
                imm = int(imm, 10)
            size = int(operand[0])
            binaryimm = signedIntToBin(imm, size) #convert signed decimal immediate to binary
            binaryimm = '0'*(size - len(binaryimm)) + binaryimm #pad zeroes to match correct length
            if(len(binaryimm) > size): #detect if user coded too large of an immediate
                print("warning: immediate too large on line " + str(lineNum)+ ". Behavior undefined") 
            encoding += binaryimm 
            argIndex += 1
        else:
            encoding += operand #this means the operand is a constant set of bits
    # print("encoding: " + '\t' + binToHex(encoding))
    return encoding


def readLines(fileName: str):
    """returns the lines of fileName as a list"""
    f = open(fileName, 'r')
    out = f.readlines()
    f.close()
    return out


def main():
    """encodes the code written in project2code.txt and write the encodings to leastreqsImage.txt"""
    instructions = readLines('project2code.txt') #load code file
    manual = readLines('leastreqsInstructionSetArchitechture.txt') #load instructionSetArchitechture file
    bitsPerReg = int(manual[0].split()[1]) #read the required size of register encodings
    mappings = {}
    for i in range(1, len(manual)): #create a map from mneumonics to encoding formats
        line = manual[i].split()
        mappings[line[0]] = line[1:]
    encodings = []
    counter = 0 #counts instructions encoded
    lineNum = 0 #line counter
    for inst in instructions: #encode the instructions line by line
        lineNum += 1
        inst = (inst[0:inst.find('//')]).strip() if inst.find('//') > -1 else inst #remove trailing whitespace and commented portion
        if(len(inst) == 0): #skip empty lines or commented lines
            continue
        counter += 1 
        encodings += binToHex(encode(inst, mappings, bitsPerReg, lineNum)) + ' ' #encode instruction and append a space
    
    out = open('leastreqsImage.txt', 'w') #open output file
    out.write("v3.0 hex words plain\n") #write header for logism to read
    out.writelines(encodings) #write the encodings 
    out.close()
    print("finished encoding " + str(counter) + " instructions.")

if __name__ == '__main__':
    main()
    