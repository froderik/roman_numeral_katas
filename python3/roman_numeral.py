INC_ALPHA = ('M',  'D', 'C', 'L', 'X', 'V', 'I')
INC_NUM =   (1000, 500, 100, 50,  10,  5,   1)
ROMAN = ''
NUMBER = -1

def check_latest_numeral (num, curr):
    global ROMAN
    while num - INC_NUM[curr] >= 0:
        ROMAN += INC_ALPHA[curr]
        num -= INC_NUM[curr]
    if curr % 2: #odd index
        if num - (INC_NUM[curr] - INC_NUM[curr + 1] ) >= 0 :
            ROMAN += INC_ALPHA[curr + 1]
            ROMAN += INC_ALPHA[curr]
            num -= ( INC_NUM[curr] - INC_NUM[curr + 1] )
    else: #even index
        if num - (INC_NUM[curr] - INC_NUM[curr + 2] ) >= 0 :
            ROMAN += INC_ALPHA[curr + 2]
            ROMAN += INC_ALPHA[curr]
            num -= ( INC_NUM[curr] - INC_NUM[curr + 2] )
    return num

def romanize () :
    global NUMBER
    for curr in range(7): #iterate down from largest numerals to smallest
        NUMBER = check_latest_numeral(NUMBER, curr)
        if NUMBER == 0:
            break

if __name__ == '__main__':
    try:
        NUMBER = int(input('Please enter a positive integer between 1 and 100,000: '))
    except:
        print('Please enter a positive integer between 1 and 100,000.')
    if NUMBER < 1 :
        print('Please enter a positive integer between 1 and 100,000.')
    elif NUMBER > 100000:
        print('Please enter a positive integer between 1 and 100,000.')
    else:
        romanize()
        print(ROMAN)
