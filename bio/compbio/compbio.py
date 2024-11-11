def base_pair(i,j):
    if [i,j] == ['A','U'] or [i,j] == ['U','A']:
        return(1)
    elif [i,j] == ['C','G'] or [i,j] == ['G','C']:
        return(1)
    else:
        return(0)


def traceback(s, seq, i, j, pair):
    if i < j:
        if s[i, j] == s[i + 1, j - 1] + base_pair(seq[i], seq[j]):
            # Case 1 chosen, new base pair i, j
            pair.append([i, j, str(seq[i]), str(seq[j])])
            traceback(s, seq, i + 1, j - 1, pair)
        elif s[i, j] == s[i + 1, j]:
            # Case 2 chosen, i remains unbound
            traceback(s, seq, i + 1, j, pair)
        elif s[i, j] == s[i, j - 1]:
            # Case 3 chosen, j remained unbound
            traceback(s, seq, i, j - 1, pair)
        else:
            for k in range(i + 1, j):
                if s[i, j] == s[i, k] + s[k + 1, j]:
                    # Case 4 chosen, new bifurcation
                    traceback(s, seq, i, k, pair)
                    traceback(s, seq, k + 1, j, pair)
                    break
    return pair

