num3 = 25
num = [20, 10]
num = [[[20, 10],[20, 10]], [[10, 40],[10, 40]]]

def type_conversion(num2:int64) -> int64:
    # global num3
    val = num3 + num2
    num3 = val
    return (num[num2+1][0][0] / 2)