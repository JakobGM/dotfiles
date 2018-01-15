import datetime
import time
import os

daytime = -1
changed = False

while True:
	now = datetime.datetime.now()

	if now.hour < 4 and time != 3:
        # Night
		daytime = 3
		changed = True

	elif now.hour < 11 and time != 0:
        # Morning
		daytime = 0
		changed = True

	elif now.hour < 16 and time != 1:
        # Lunch
		daytime = 1
		changed = True

	elif now.hour < 22 and time != 2:
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
		os.system("feh --bg-scale $HOME/.config/i3/backgrounds/vally-"+str(daytime)+".jpg")

	time.sleep(60)
