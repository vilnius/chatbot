#!/usr/bin/env python


def check_avx():
    with open('/proc/cpuinfo') as f:
        for line in f:
            if line.startswith('flags'):
                flags = line.lower().split(':', 1)[1].strip().split()
                if 'avx' in flags:
                    return True
    return False


if not check_avx():
    print("Your CPU does not support AVX and Tensorfow won't work. Try to install Tensorflow 1.5.")
