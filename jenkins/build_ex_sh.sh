#!/usr/bin/env sh

PYENV_HOME=$WORKSPACE/.pyenv/
JENKINS_FILES=$WORKSPACE/jenkins/

# Delete previously built virtualenv
if [ -d $PYENV_HOME ]; then
    rm -rf $PYENV_HOME
fi

# Setup a proper path, I call my virtualenv dir "venv" and
# I've got the virtualenv command installed in /usr/local/bin
PATH=$WORKSPACE/venv/bin:/usr/local/bin:$PATH
if [ ! -d "venv" ]; then
        virtualenv-2.7 venv
fi
. venv/bin/activate


# Create virtualenv and install necessary packages
virtualenv --no-site-packages $PYENV_HOME
. $PYENV_HOME/bin/activate
#pip install --quiet nosexcover
#pip install --quiet pylint
pip install --quiet $WORKSPACE/  # where your setup.py lives
pip install -r $JENKINS_FILES/requirements.txt
#nosetests --with-xcoverage --with-xunit --cover-package=myapp --cover-erase
#pylint -f parseable myapp/ | tee pylint.out
