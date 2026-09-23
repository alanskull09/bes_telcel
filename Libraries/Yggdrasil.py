import time
import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By 
from selenium.webdriver.chrome.webdriver import WebDriver
# save following snippet as python file (shadow.py)
from robot.libraries.BuiltIn import BuiltIn
from PIL.Image import WEB


def replace_values(text,value):
    """Replaces ``value`` in the given ``text``.
    
        ``old_value`` always be the string `Replace` for this keyword
        
        ``original string`` should be modified previously to include the text `Replace`


        ``value`` is used as a literal string.


        A modified version of the string is returned and the original
        string is not altered.
        
        See `Replace String` from Robot Framework Library if more powerful pattern matching is needed.
        If you need to just remove a string see `Remove String`.
        
        This is for more dynamic xpath creations 


        Examples:
        | ${str} =        | Replace Value | //input[@id="Replace"]  | authServiceNum   |
        | Should Be Equal | ${str}         | //input[@id="authServiceNum"] | 
        """
    old_value = 'Replace' 
    new_value = value
    l_value = text.replace(old_value,new_value)
    return  l_value


def expand_shadow_element(element):
  driver = element._parent  
  shadow_root = driver.execute_script('return arguments[0].shadowRoot', element)
  return shadow_root


def close_print_shadow_root():
  seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
  driver = seleniumlib.driver
 
  root1 = driver.find_element_by_tag_name('print-preview-app')
  shadow_root1 = expand_shadow_element(root1)

  root2 = shadow_root1.find_element_by_id("sidebar")
  shadow_root2 = expand_shadow_element(root2)

  root3 = shadow_root2.find_element_by_tag_name('print-preview-button-strip')
  shadow_root3 = expand_shadow_element(root3)

  cancel_button = shadow_root3.find_element_by_class_name("cancel-button")
  cancel_button.click()

  
def highlight(element):
    """Highlights (blinks) a Selenium Webdriver element"""
    driver = element._parent
    def apply_style(s):
        driver.execute_script("arguments[0].setAttribute('style', arguments[1]);",
                              element, s)
    original_style = element.get_attribute('style')
    apply_style("background-color:rgba(0, 0, 255, 0.2); border: 4px Solid Blue;")
    time.sleep(.2)
    apply_style(original_style)
