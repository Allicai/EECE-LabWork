import argparse

def create_coe(val):
    s = "memory_initialization_radix=16;\nmemory_initialization_vector=" + ",".join(val) + ";"
    return s


def main(file):
    f = open(file)
    string_val = f.read()
    lines = string_val.split('\n')
    flag = 0
    result = list()
    for i in lines:
        if i == '\n' or i == "":
            continue
        if flag == 0:
            if '00' in i:
                flag = 1
        elif flag == 1:
            if '00' in i:
                continue
            if "Disassembly" in i:
                flag = 0
                break
            else:
                print("here",i)
                i = i.strip()
                i = i.split(" ")[0].replace("\t","").split(":")[1]
                result.append(i)
    output = create_coe(result)
    output_file = open("./output.coe","w")
    output_file.write(output)
    print("completed")
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--file",type=str)
    args = parser.parse_args()
    main(args.file)

