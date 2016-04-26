from math import sin, cos, gamma, pi
from random import gauss, uniform

import matplotlib.pyplot as plt


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


def levy_flight(beta, nb_steps):
    """Compute `nb_steps` random steps from a Lévy distribution.
    :param nb_steps: Number of step for the lévy flight
    :param beta: 0 < `beta` < 2
    """
    # Start point of the lévy flight
    x, y = [0], [0]
    # Compute other steps using a direction draw from a uniform distribution
    for step in range(1, nb_steps + 1):
        angle = uniform(0, 1) * 2 * pi
        step_length = levy_step_length(beta=beta)
        x.append(x[step - 1] + step_length * cos(angle))
        y.append(y[step - 1] + step_length * sin(angle))
    return (x, y)


def browian_motion(sigma, nb_steps, mu=0):
    # Start point of the lévy flight
    x, y = [0], [0]
    # Compute other steps using a direction draw from a uniform distribution
    for step in range(1, nb_steps + 1):
        angle = uniform(0, 1) * 2 * pi
        step_length = gauss(mu, sigma)
        x.append(x[step - 1] + step_length * cos(angle))
        y.append(y[step - 1] + step_length * sin(angle))
    return (x, y)


def uniform_motion(nb_steps, left_tail=0, righ_tail=1):
    # Start point of the lévy flight
    x, y = [0], [0]
    # Compute other steps using a direction draw from a uniform distribution
    for step in range(1, nb_steps + 1):
        angle = uniform(left_tail, righ_tail) * 2 * pi
        step_length = uniform(0, 1)
        x.append(x[step - 1] + step_length * cos(angle))
        y.append(y[step - 1] + step_length * sin(angle))
    return (x, y)


def draw_levy_flight(nrows, ncols, beta, n_steps):
    fig, ax = plt.subplots(nrows, ncols, figsize=(24, 14), dpi=80, facecolor='w')
    for col in range(ncols):
        for row in range(nrows):
            x, y = levy_flight(beta, n_steps)
            ax[row][col].plot(x, y, color="#268bd2", linewidth=2)
            ax[row][col].plot([x[0]], [y[0]], '#859900', marker="s", markersize=10)
            ax[row][col].plot([x[-1]], [y[-1]], '#dc322f', marker="s", markersize=10)
            ax[row][col].set_frame_on(True)
            ax[row][col].axis('off')
    fig.tight_layout()


def draw_browian_motion(nrows, ncols, sigma, n_steps):
    fig, ax = plt.subplots(nrows, ncols, figsize=(24, 14), dpi=80, facecolor='w')
    for col in range(ncols):
        for row in range(nrows):
            x, y = browian_motion(sigma, n_steps)
            ax[row][col].plot(x, y, color="#268bd2", linewidth=2)
            ax[row][col].plot([x[0]], [y[0]], '#859900', marker="s", markersize=10)
            ax[row][col].plot([x[-1]], [y[-1]], '#dc322f', marker="s", markersize=10)
            ax[row][col].set_frame_on(True)
            ax[row][col].axis('off')
    fig.tight_layout()


def draw_uniform_motion(nrows, ncols, sigma, n_steps):
    fig, ax = plt.subplots(nrows, ncols, figsize=(24, 14), dpi=80, facecolor='w')
    for col in range(ncols):
        for row in range(nrows):
            x, y = uniform_motion(n_steps)
            ax[row][col].plot(x, y, color="#268bd2", linewidth=2)
            ax[row][col].plot([x[0]], [y[0]], '#859900', marker="s", markersize=10)
            ax[row][col].plot([x[-1]], [y[-1]], '#dc322f', marker="s", markersize=10)
            ax[row][col].set_frame_on(True)
            ax[row][col].axis('off')
    fig.tight_layout()


def draw_random_walks(n_steps, beta=1.5, sigma=1):
    fig, ax = plt.subplots(1, 1, figsize=(24, 14), dpi=80, facecolor='w')
    x, y = browian_motion(sigma, n_steps)
    ax.plot(x, y, color="#859900", linewidth=2)
    ax.plot([x[-1]], [y[-1]], '#859900', marker="s", markersize=10)

    x, y = levy_flight(beta, n_steps)
    ax.plot(x, y, color="#268bd2", linewidth=2)
    ax.plot([x[-1]], [y[-1]], '#268bd2', marker="s", markersize=10)

    ax.plot([x[0]], [y[0]], 'k', marker="o", markersize=10)
    ax.set_frame_on(True)
    ax.axis('off')
    fig.tight_layout()


def draw_random_levy(beta, n=100):
    fig, ax = plt.subplots(1, 1, figsize=(24, 14), dpi=80, facecolor='w')
    x = list(range(n))
    y = [levy_step_length(beta=beta) for el in x]
    ax.bar(x, y, color="#268bd2", linewidth=2, width=0.6)
    ax.set_frame_on(True)
    ax.axis('off')
    fig.tight_layout()


def test_levy_flight(nrows, ncols, beta_init, n_steps_init):
    pass
    fig, ax = plt.subplots(nrows, ncols)
    for col in range(ncols):
        n_steps_iter = n_steps_init
        beta_init += 0.25
        for row in range(nrows):
            x, y = levy_flight(beta_init, n_steps_iter)
            ax[row][col].plot(x, y, color="#268bd2", linewidth=2)
            ax[row][col].plot([x[0]], [y[0]], '#859900', marker="o", markersize=10)
            ax[row][col].plot([x[-1]], [y[-1]], '#dc322f', marker="o", markersize=10)
            ax[row][col].set_frame_on(True)
            ax[row][col].axes.get_yaxis().set_visible(False)
            ax[row][col].axes.get_xaxis().set_visible(False)
            ax[row][col].set_axis_bgcolor('#fdf6e3')
            ax[row][col].set_title("beta = {:.2f}\n{} marches aléatoires".format(beta_init, n_steps_iter))
            n_steps_iter = n_steps_iter * 3
    fig.tight_layout()


if __name__ == '__main__':
    # draw_levy_flight(nrows=3, ncols=3, beta=1.5, n_steps=200)
    # draw_browian_motion(nrows=3, ncols=3, sigma=1, n_steps=200)
    # draw_uniform_motion(nrows=3, ncols=3, sigma=1, n_steps=200)
    # draw_random_walks(n_steps=1000, beta=1.5, sigma=1)
    # draw_random_levy(beta=1.5, n=100)

    draw_uniform_motion(nrows=2, ncols=2, sigma=1, n_steps=20000)
    # draw_levy_flight(nrows=2, ncols=2, beta=1.5, n_steps=100000)
    # draw_uniform_motion(nrows=3, ncols=3, sigma=1, n_steps=2000)
    plt.show()
