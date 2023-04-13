# Get bmp image of character
# Make class that draws character at the center of the screen
# Match bg color of character to the screen bg color

import sys

import pygame

class Head:
    """A floating head."""

    def __init__(self, window):
        """Initialize floating head and position."""
        self.screen = window.screen
        self.screen_rect = window.screen.get_rect()
        self.image = pygame.image.load("images/head.bmp")
        self.rect = self.image.get_rect()
        self.rect.center = self.screen_rect.center


    def blitme(self):
        self.screen.blit(self.image, self.rect)

