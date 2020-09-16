#!/usr/bin/env python

import re
import sys

def txtToCSV(filepath, outPath):
    i=0
    with open(filepath, "r") as file:
        with open(outPath, "w+") as out:
            for idx, line in enumerate(file):
                splitedLine = re.split("[ ]+", line)[1:]
                if idx == 0:
                    out.write(f"class,{','.join([str(i) for i in range(len(splitedLine)-1)])}\n")
                out.write(",".join(splitedLine))
                i += 1

if __name__ == '__main__':
    filepath = sys.argv[1]
    out_filepath = sys.argv[2]

    
    txtToCSV(filepath, out_filepath)

