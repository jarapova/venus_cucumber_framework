**How to install Allure-cucumber version 2.10.0.beta3:**
 1. After cloning project go to Gemfile and include following gems:
   <br>`gem 'allure-cucumber', '~> 2.10.0.beta3'`</br>
   <br>`gem 'allure-ruby-commons', '~> 2.10.0.beta3'`</br>
 2. Then include Allure in env.rb by adding at the top:
   require 'allure-cucumber'
   require 'allure-ruby-commons'
 3. To invoke allure for creating reports you should run your cucumber
   tests with _--format Allure::CucumberFormatter --out where/you/want/results_
   or you can add this command in **config/cucumber.yml**
   By default cucumber uses pretty output with different colors in console.
   To keep both formatted outputs (allure and cucumber) add in the end of your 
   command _--format pretty_ or add it to **cucumber.yml** 
 4. After finishing your cucumber tests results directory will contain several .json files.
   To see report in your browser you should install Allure CLI, 
   see https://docs.qameta.io/allure/#_installing_a_commandline for installation
   and then type in terminal _allure serve path/to/results/dir_
   If you want to generate shareable html, type _allure generate path/to/results/dir_
   Default save path is _your_working_directory/allure-report_ to change directory 
   add to command key _-o your/html/dir_
   **WARNING:** If your directory has already previously generated report, Allure will not 
   generate report. To overwrite existing report add _--clean_ in the end of the command.
   
**Note:** Allure version 2.10.0.beta3 does not support clearing results directory