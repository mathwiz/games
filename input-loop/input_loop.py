def input_loop(prompt, validator):
    input = raw_input(prompt)
    if validator(input):
        return input
    else:
        return input_loop(prompt, validator)


empty_validator = lambda x : x != ""

def verbose_validator(x):
    print("The input was '%s'" % (x))
    return x != ""
