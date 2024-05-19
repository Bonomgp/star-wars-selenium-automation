# movie_page.py
import keyword
from selenium.webdriver.common.by import By
from selenium import webdriver
import threading
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class HomePage:
    def __init__(self, driver):
        self.driver = driver
        self.sort_title_header = (By.XPATH, "//th[text()='Title']")
        self.arrow_drop_up_icon = (By.XPATH, "//*[@data-testid='ArrowDropUpIcon']")
        self.arrow_drop_down_icon = (By.XPATH, "//*[@data-testid='ArrowDropDownIcon']")
        self.last_movie_title = (By.XPATH, "//tr[6]/td[1]")
        self.specific_movie_title_locator = lambda title: (By.XPATH, f"//td/a[contains(text(),'{title}')]")
        self.home_logo = (By.XPATH, "//section/img")

    @keyword
    def sort_by_title(self, direction='asc'):
        sort_icon = self.arrow_drop_up_icon if direction == 'asc' else self.arrow_drop_down_icon
        opposite_icon = self.arrow_drop_down_icon if direction == 'desc' else self.arrow_drop_up_icon

        if self.driver.find_element(*opposite_icon).is_displayed():
            WebDriverWait(self.driver, 10).until(
                EC.element_to_be_clickable(self.sort_title_header)
            ).click()

    @keyword
    def click_specific_movie_title(self, title):
        WebDriverWait(self.driver, 3).until(
                EC.element_to_be_clickable(self.specific_movie_title_locator(title))
            ).click()

    @keyword
    def get_last_movie_title(self):
        time.sleep(5)
        return WebDriverWait(self.driver, 10).until(
            EC.visibility_of_element_located(self.last_movie_title)
        ).text

    @keyword
    def is_sorted_ascending(self):
        return self.driver.find_element(*self.arrow_drop_up_icon).is_displayed()

    @keyword
    def is_sorted_descending(self):
        return self.driver.find_element(*self.arrow_drop_down_icon).is_displayed()

if __name__ == '__main__':
    HomePage(webdriver.Chrome())