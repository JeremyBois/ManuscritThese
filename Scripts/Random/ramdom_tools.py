from math import gamma, floor, sin, pi
from random import gauss, uniform


def levy_step_length(beta):
    """Compute a random step size using Mantegna algorithm which allows to compute
        a random number from stable and symétrique Lévy distribution.
    """
    sigma_u = 1
    sigma_v = ((gamma(1 + beta) * sin(pi * beta / 2)) / (gamma((1 + beta) / 2) * beta * 2**((beta - 1) / 2))) ** (1 / beta)
    # Compute random parameter using gaussian distribution
    u = gauss(0, sigma_u)
    v = gauss(0, sigma_v)
    return u / (abs(v) ** (1 / beta))


def initialize_roulette_wheel(sources):
    """Return an array of cumulative sources fitness in O(n)"""
    array = [sources[0].fitness, ]
    for (ind, source) in enumerate(sources[1:]):
        array.append(array[ind] + source.fitness)
    return array


def pick_roulette_wheel(cum_weighted_array):
    """Pick a random number from a `cumulative weighted array` and return it’s
       index in O(log(n)).
    """
    rand_element = uniform(0, cum_weighted_array[-1])
    left, right = 0, len(cum_weighted_array) - 1
    while not(left > right):
        m = floor((left + right) / 2)
        if cum_weighted_array[m] < rand_element:
            left = m + 1
        elif cum_weighted_array[m] > rand_element:
            right = m - 1
        else:
            # We find a perfect match
            break
    if not(cum_weighted_array[m] > rand_element):
        return m + 1
    else:
        return m
