from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from robot.api.deco import keyword

class MoviePage:
    def __init__(self, driver):
        self.driver = driver
        self.species_list = (By.XPATH, "//div[2]/div[3]")
        self.planets_list = (By.XPATH, "//div[2]/div[2]")
        self.back_to_home_button = (By.XPATH, "//a[text()='Back']")

    @keyword
    def species_contains(self, species_name):
        species_elements = WebDriverWait(self.driver, 10).until(
            EC.visibility_of_all_elements_located(self.species_list)
        )
        return any(species_name in element.text for element in species_elements)

    @keyword
    def planets_does_not_contain(self, planet_name):
        planets_elements = WebDriverWait(self.driver, 10).until(
            EC.visibility_of_all_elements_located(self.planets_list)
        )
        return not any(planet_name in element.text for element in planets_elements)

    @keyword
    def back_to_home(self):
        WebDriverWait(self.driver, 3).until(
            EC.element_to_be_clickable(self.back_to_home_button)
        ).click()

    @keyword
    def initialize_movie_page(self, driver):
        return MoviePage(driver)