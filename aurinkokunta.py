from vpython import *
import math
# Näkymän asetukset: koko, tausta ja kamera (top view)
scene.width = 1200
scene.height = 800
scene.background = color.black
scene.caption = ("Aurinkokunta (top view): Planeetat kiertoradoillaan\n"
                 "Käytä hiirtä pyörittääksesi, zoomataksesi ja panoroidaksesi näkymää.")
# Aseta kamera ylhäältä (top view)
scene.camera.pos = vector(0, 50, 0)
scene.camera.axis = vector(0, -50, 0)
scene.userspin = True
scene.userzoom = True
scene.autoscale = False
# Luodaan Aurinko keskelle
sun = sphere(pos=vector(0, 0, 0), radius=2, color=color.yellow, emissive=True)
# Määritellään planeettojen tiedot – yksinkertaistettu malli
# Kulmanopeudet on nostettu, jotta liike olisi näkyvämpää
planets_data = [
    {"name": "Mercury", "orbit_radius": 4,  "radius": 0.3, "color": color.gray(0.5), "angular_speed": 0.2},
    {"name": "Venus",   "orbit_radius": 7,  "radius": 0.5, "color": color.orange,      "angular_speed": 0.15},
    {"name": "Earth",   "orbit_radius": 10, "radius": 0.5, "color": color.blue,        "angular_speed": 0.1},
    {"name": "Mars",    "orbit_radius": 15, "radius": 0.4, "color": color.red,         "angular_speed": 0.075},
    {"name": "Jupiter", "orbit_radius": 20, "radius": 1.0, "color": color.orange,      "angular_speed": 0.05},
    {"name": "Saturn",  "orbit_radius": 25, "radius": 0.9, "color": color.yellow,      "angular_speed": 0.04},
    {"name": "Uranus",  "orbit_radius": 30, "radius": 0.7, "color": color.cyan,        "angular_speed": 0.03},
    {"name": "Neptune", "orbit_radius": 35, "radius": 0.7, "color": color.blue,        "angular_speed": 0.025}
]

planets = []    # sphere-oliot
angles = []     # nykyiset kulmat (rad)
labels = []     # planeettojen nimien labelit
orbits = []     # planeettojen kiertoradat (curve-oliot)
# Luodaan planeetat ja niiden orbiitit
for pdata in planets_data:
    # Luodaan planeetan kiertorata piirrettynä ohutviivaisena ympyränä
    orbit_points = []
    for deg in range(0, 361, 2):
        theta = math.radians(deg)
        x = pdata["orbit_radius"] * math.cos(theta)
        z = pdata["orbit_radius"] * math.sin(theta)
        orbit_points.append(vector(x, 0, z))
    orbit_curve = curve(pos=orbit_points, color=color.white, radius=0.01)
    orbits.append(orbit_curve)
    
    # Luodaan planeetta asetettuna kiertoradalle kulmasta 0 (x-z -tasossa)
    planet = sphere(pos=vector(pdata["orbit_radius"], 0, 0), radius=pdata["radius"],
                    color=pdata["color"], make_trail=True, trail_type="points", 
                    trail_radius=0.05, retain=200)
    planets.append(planet)
    angles.append(0)
    
    # Luodaan label, joka näyttää planeetan nimen ja kulmanopeuden
    lbl = label(pos=planet.pos, text=f"{pdata['name']}\n{pdata['angular_speed']:.3f} rad/s",
                xoffset=20, yoffset=20, space=planet.radius, height=10, border=4,
                font='sans', box=False, opacity=0)
    labels.append(lbl)

dt = 0.01  # Aikasteppi

# Pääsilmukka: päivitetään planeettojen kulmat ja sijainnit
while True:
    rate(100)  # 100 päivitystä sekunnissa
    for i, pdata in enumerate(planets_data):
        # Päivitetään kulma
        angles[i] += pdata["angular_speed"] * dt
        r = pdata["orbit_radius"]
        x = r * math.cos(angles[i])
        z = r * math.sin(angles[i])
        # Päivitetään planeetan sijainti
        planets[i].pos = vector(x, 0, z)
        # Päivitetään label, jotta se seuraa planeettaa hieman sen yläpuolella
        labels[i].pos = planets[i].pos + vector(0, planets[i].radius + 0.5, 0)