import datetime
import time
import os

from astral import Location

# Initialize a custom location for astral, as it doesn't necessarily include
# your current city of residence
l = Location()

# These two doesn't really matter
l.name = os.getenv('CITY', 'Trondheim')
l.region = os.getenv('REGION', 'Europe')

# But these are important
l.latitude = float(os.getenv('LATITUDE', '63.446827'))
l.longitude = float(os.getenv('LONGITUDE', '10.421906'))
l.timezone = os.getenv('TIMEZONE', 'Europe/Oslo')
l.elevation = float(os.getenv('ELEVATION', '0'))

daytime = -1
changed = False

while True:
    now = datetime.datetime.now()

    if now.hour < l.sun()['dawn'].hour and time != 3:
        # Night
        daytime = 3
        changed = True

    elif now.hour < l.sun()['noon'].hour and time != 0:
        # Morning
        daytime = 0
        changed = True

    elif now.hour < l.sun()['sunset'].hour and time != 1:
        # Lunch
        daytime = 1
        changed = True

    elif now.hour < l.sun()['dusk'].hour and time != 2:
        # Evening
        daytime = 2
        changed = True

    elif time != 3:
        # Night
        daytime = 3
        changed = True

    if changed:
        # We are in a new time of day, and we can change the background image
        changed = False
        os.system('feh --bg-scale $HOME/.config/i3/backgrounds/vally-'+str(daytime)+'.jpg')

        # Change the conky font color accordingly
        if daytime in (0, 1, 2,):
            os.system('sed -i "s/CBCDFF/282828/g" $XDG_CONFIG_HOME/conky/*.conf')
        else:
            os.system('sed -i "s/282828/CBCDFF/g" $XDG_CONFIG_HOME/conky/*.conf')

    time.sleep(60)
