# movie_page.py
import keyword
from selenium.webdriver.common.by import By
from selenium import webdriver
import threading
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

from SeleniumLibrary import SeleniumLibrary

class MoviePage():

    def __init__(self, driver):
        self.driver = driver
        self.species_list = "//ul[@id='species']/li"
        self.planets_list = "//ul[@id='planets']/li"

    @keyword
    def species_contains(self, species_name):
        species_elements = self._element_find(self.species_list, False, True)
        return any(species_name in element.text for element in species_elements)

    @keyword
    def planets_does_not_contain(self, planet_name):
        planets_elements = self._element_find(self.planets_list, False, True)
        return not any(planet_name in element.text for element in planets_elements)