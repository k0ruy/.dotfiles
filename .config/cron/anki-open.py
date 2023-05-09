import subprocess
import datetime
from collections import Counter
import logging
import os

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

NOW = datetime.datetime.now().strftime("%H:%M")

def check_anki_status(target_time="18:00", late_time="21:00", status_file="/home/christian/.config/cron/anki_status.log"):
    """
    Checks if Anki was running at any point during the day and sends a notification if necessary.

    Keymap of the log file:
        0: Anki is not open
        1: Anki is open
        2: first notification has been sent

    :param target_time: The target time before which Anki should have been opened. Default is "18:00".
    :type target_time: str
    :param late_time: The latest time after which Anki should not be opened. Default is "21:00".
    :type late_time: str
    :param status_file: The path and name of the status file. Default is "/tmp/anki_status.log".
    :type status_file: str
    """
    
    # Check if Anki is running and append its status to the status file
    anki_running = "1" if subprocess.run(["pgrep", "-x", "anki"], stdout=subprocess.PIPE).stdout.decode().strip() else "0"
    with open(status_file, "a") as f:
        f.write(f"{anki_running}")
    
    # Check if Anki was running at any point during the day
    with open(status_file) as log:
        content = list(log.read())
        uniques = dict(Counter(content).items())

        # condition to meet
        not_open = "1" not in content
        not_enough_time = "1" in content and uniques["1"] <= 10
        notification_sent = "2" in content

        if not_open or not_enough_time:
            # If Anki was open for less than 10 minutes and it's past the target time, send a notification
            if target_time <= NOW <= late_time and not notification_sent:
                logger.info("Sending Anki notification.")
                subprocess.run(["notify-send", "--expire-time=30000", "--urgency=critical", " 󰚩  Het jy Japannees gestudeer?"])
                
                # write "2" to the file that notification was sent
                with open(status_file, "a") as f:
                    f.write("2")

            # If Anki was not open before the late time, send another notification
            if NOW >= late_time:
                logger.info("Sending Anki notification.")
                subprocess.run(["notify-send", "--expire-time=30000", "--urgency=critical", " 󰚩  JAPANEEEEEESS ??!!!!"])

    # delete file once all the eventual notifications have been sent
    if NOW > late_time:
        os.remove(status_file)


if __name__ == "__main__":

    check_anki_status()
