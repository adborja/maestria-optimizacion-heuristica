from simulated_annealing import TSPSimulatedAnnealing
import math
import pandas as pd

"""
Transforma coordenadas polares (latitud, longitud) en coordenadas cartesianas
"""
def to_cartesian(lat, lon):
    c = []
    lat = math.radians(lat)
    lon = math.radians(lon)
    R = 6371.0
    x = round(R * math.cos(lat) * math.cos(lon), 3)
    y = round(R * math.cos(lat) * math.sin(lon), 3)
    c.append(x)
    c.append(y)
    return c

def f(x):
    return to_cartesian(x[1], x[2])

df = pd.read_csv('coord_980_polar.txt', header=None, delim_whitespace = True)
df = df.drop(df.columns[0], 1)
df = df.apply(f, axis = 1)
df = df.drop_duplicates(keep = False)
coords = df.values.tolist()

if __name__ == '__main__':
    sa = TSPSimulatedAnnealing(coords, max_iteraciones= 5000)
    sa.simulated_annealing()
    sa.mostrar_rutas()
    sa.mostrar_fitness()