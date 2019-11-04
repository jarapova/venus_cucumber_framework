**This document describes how to attach screenshots to your Allure report file**

To use this feature tests should be run from commandline like
    _cucumber path/to/your/cucumber.feature screenshot_on_fail=true_
    
screenshot_on_fail is an environment variable that is used for checking if screenshot
attachment on fail is needed

In **env.rb** you can find:
SCREENSHOT_DIR constant which represents default directory to screenshots

add_screenshot method which is used for adding screenshots to SCREENSHOT_DIR

clear_screenshot_dir method which is used for CLEARING ALL FILES from SCREENSHOT_DIR before new 
tests are being launched, so make sure that you saved necessary information from this directory