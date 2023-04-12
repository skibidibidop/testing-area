# Make pygame window with blue background

import sys

import pygame

class BlueSky:
    """Pygame window with blue bg."""

    def __init__(self):
        """Initialize with blue bg."""
        pygame.init()
        self.screen = pygame.display.set_mode((640,480))
        self.bg = (0, 0, 255)


    def run_window(self):
        """Launch window to display blue,
        wait for user to quit.
        """
        while True:
            for event in pygame.event.get():
                """Wait for quit event."""
                if event.type == pygame.QUIT:
                    sys.exit()

            self.screen.fill(self.bg)
            pygame.display.flip()


if __name__ == "__main__":
    blue_window = BlueSky()
    blue_window.run_window()

