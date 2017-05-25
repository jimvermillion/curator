from subprocess import call
import time


if __name__ == "__main__":
    while True:
        call(["curator", "--config", "curator.yml", "actions.yml"])

        # once a day
        time.sleep(86400)
