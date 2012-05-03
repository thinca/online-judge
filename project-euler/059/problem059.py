with open('cipher1.txt') as f:
    cipher = map(int, f.read().strip().split(','))

KEY_LENGTH = 3

keys = [[] for x in range(KEY_LENGTH)]
list = [{} for x in range(KEY_LENGTH)]

for i, n in enumerate(cipher):
    list[i % KEY_LENGTH][n] = list[i % KEY_LENGTH].get(n, 0) + 1

list = map(lambda x: sorted(x.items(), key = lambda e: e[1]), list)

for i, l in enumerate(list):
    l = map(lambda x: x[0], reversed(l))
    for n in ' ':
        key = ord(n) ^ l[0] # l[0] is the character used most.
        if len(filter(lambda x: x < 0x20 or 0x7E < x, map(lambda x: x ^ key, l))) != 0:
            continue
        keys[i] = key
    assert keys[i] != None, 'Detection failed.'

plain = map(lambda x: x[1] ^ keys[x[0] % KEY_LENGTH], enumerate(cipher))
print sum(plain)
# Print the original text.
# print ''.join(map(chr, plain))
