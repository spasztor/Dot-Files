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

import os
import logging
import platform
import shutil
import sys
import xml.etree.ElementTree as ElementTree

def main_driver():
    """Main driver for script"""
    config_file_path = os.path.join(os.path.dirname(__file__), "config.xml")
    tree = ElementTree.parse(config_file_path)
    root = tree.getroot()
    dot_types = {}

    if os.path.isfile(config_file_path) == False:
        raise Exception("Source file " + config_file_path + " not found.")

    for dot_type in root.findall('dot_type'):
        dot_types[dot_type.get('name')] = dot_type

    for dot_file in root.findall('dot_file'):

        if platform.system() in dot_type.get("os_supported") \
            or dot_file.get("type") == "custom":

            if dot_file.get("type") != "custom":
                dot_type = dot_types[dot_file.get('type')]
                dest = os.path.join(os.environ['HOME'],
                                    dot_type.find('dest').find(platform.system()).text,
                                    dot_file.get('path'))
                src = os.path.join(os.path.dirname(__file__), "..", dot_type.get('src'),
                                   dot_file.get('path'))
            else:
                dest = os.path.join(os.environ['HOME'],
                                    dot_file.find('dest').find(platform.system()).text)
                src = os.path.join(os.path.dirname(__file__), "..", dot_file.get('path'))

            if os.path.isfile(src) == False:
                raise Exception("Source file " + src + " not found. Error in XML file.")

            if os.path.exists(os.path.dirname(dest)) is False:
                os.makedirs(os.path.dirname(dest))

                if dot_file.get('symlnk') == "true" and platform.system() is "Windows":
                    shutil.copyfile(src, dest) # fuck this makes me sad.
                else:
                        os.symlink(src, dest)
            else:
                shutil.copyfile(src, dest)
        else:
          raise Exception("OS not Supported.")

try:
    main_driver()
    print("Files have been succesfuly transferred")
    logging.info("Program ran with no errors.")
except:
    logging.exception("Received Exception on main_driver.")
