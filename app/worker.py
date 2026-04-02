"""Worker placeholder — will consume from Redis in Phase 2."""

import time


def main():
    print("Worker is alive — waiting for tasks…")
    while True:
        time.sleep(5)


if __name__ == "__main__":
    main()
