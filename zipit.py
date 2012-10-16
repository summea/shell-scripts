#!/usr/bin/env python

"""
ZipIt
A simple script to zip files.

Usage: python zipit.py final_product.zip file1 file2 file3

MIT license
"""

import sys
import subprocess

if len(sys.argv) > 2:
    zip_file_name = [sys.argv[1]]
    files_to_zip = sys.argv[2:]

    PIPE = subprocess.PIPE
    pd = subprocess.Popen(['/usr/bin/zip', '-r'] +
        zip_file_name + files_to_zip, stdout=PIPE, stderr=PIPE)
    stdout, stderr = pd.communicate()
else:
    print "Please choose files to zip."
