# This is a screen to show a floating head

import sys

import pygame
from head import Head

class FloatingHead:
    """A screen to show a floating head."""

    def __init__(self):
        """Initialize screen size, bg color."""
        pygame.init()
        self.screen = pygame.display.set_mode((640, 480))
        self.bg_color = (100, 100, 100)
        self.head = Head(self)

        pygame.display.set_caption("Floating Head")


    def run_window(self):
        """Launch window to show a floating head."""
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    sys.exit()

            self.screen.fill(self.bg_color)
            self.head.blitme()
            pygame.display.flip()


if __name__ == "__main__":
    window = FloatingHead()
    window.run_window()

