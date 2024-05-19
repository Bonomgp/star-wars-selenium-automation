from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class SetupAndTearDown:
    @classmethod
    def setUpClass(cls, url, browser='chrome'):
        # Initialize the WebDriver
        if browser == 'chrome':
            cls.driver = webdriver.Chrome()
        elif browser == 'firefox':
            cls.driver = webdriver.Firefox()
        elif browser == 'edge':
            cls.driver = webdriver.Edge()
        elif browser == 'safari':
            cls.driver = webdriver.Safari()
        else:
            raise ValueError(f"Unsupported browser: {browser}")
        
        # cls.driver.get(url)
        cls.driver.maximize_window()
        cls.driver.implicitly_wait(10)
        
    @classmethod
    def tearDownClass(cls):
        # Close the WebDriver
        cls.driver.quit()

if __name__ == '__main__':
    SetupAndTearDown.setUpClass()
    SetupAndTearDown.tearDownClass()
