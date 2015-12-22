"""
This is a python script used to distribute the files specified in the config.xml out to their
respective spots depending on whether or not the os is windows or linux.
"""
#!/usr/bin/emv python

__author__ = "Szabolcs Pasztor"
__copyright__ = "Copyright 2010, The Cogent Project"
__credits__ = "Szabolcs Pasztor"
__license__ = "GPL"
__version__ = "1.0.1"
__email__ = "szabolcs1992@gmail.com"
__status__ = "Development"

import logging
import shutil
import sys
import xml.etree.ElementTree as ElementTree

def main_driver():
    """Main driver for script"""
    tree = ElementTree.parse('config.xml')
    root = tree.getroot()

    for dot_file in root.findall('dot_file'):
        dot_type = root.find('.//dot_type'[@name=dot_file.get('type')])
        if os.name in dot_type.get("os_supported"):
            src = os.path.join(os.path.dirname(__file__), dot_type.get('src'),
                               dot_file.get('path'))
            dest = os.path.join(os.environ['HOME'], dot_type.find('dest').get(os.name), 
                                dot_file.get('path'))
            if dot_file.get('symlnk') = true:
                os.symlink(src, dest)
            else:
                shutil.copyfile(src, dest)

try:
    main_driver()
    logging.info(("Program ran with no errors.")
except:
    logging.exception("Received Exception on main_driver.")
