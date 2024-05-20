# star-wars-selenium-automation

## Steps to get up and running
​
The following steps will allow you to execute the tests on your computer.
​
### Prerequisites
​
```
Any modern IDE/Text editor can be used to work with the project but my personal preference is VS code with the "Robot Framework Language Server" extension installed.
​
ChromeDriver - Can Install using homebrew on Mac: brew install --cask chromedriver
​
python 3.10 or Greater > Can Install using homebrew on Mac: brew install python3

pip3 - Should be installed with python3
​
Virtualenv - 
​
Required python modules to run project are stored in the requirements.txt file. (Install those to dedicated isolated environment when mentioned below)
```
​
### Installing (skip the steps if already installed)
​
Install (download and add to path) the latest ChromeDriver from: http://chromedriver.chromium.org/

Install Python 3.10 (or greater) from https://www.python.org/

From cmd/bash run:
```
pip3 install virtualenv
```

Proceed to cd to the root of the web_automation directory and create a new isolated virtual environment, run: virtualenv venv  (we can just pip install to the global python install but it is best to manage dependencies on a per project basis and not 'throw' them all together)
​
```
virtualenv -p python3 venv
```
​
Activate the newly created Python3 virtual environment, from cmd/bash run:
```
source venv/bin/activate
```
All cmd/bash commands will then start with (venv) indicating that the virtual environment is active
​
From cmd/bash run:
```
pip3 install -r requirements.txt
```
which will install all of the needed requirements in the newly created isolated python environment.

​
Run Tests:
```
robot  --variable browser:chrome -d results/ tests/tests.robot
```