#!/usr/bin/env python3

import subprocess
from functions import *
from variables import *

# Re-create old folder
RecreateDir(DEPLOY_DIR)

# Copy files/dirs for deployment
dst = DEPLOY_DIR
for src in RELEASE_PATHS_TO_DEPLOY:
    Copy(src, dst)

# Deploy settings
args = []
if Os() == 'mac':
    args = ['macdeployqt',
            '{}'.format(pjoin(APP_FILE_TO_DEPLOY)),
            '-qmldir={}'.format(pjoin(QML_DIR)),
            '-verbose=1']
elif Os() == 'win':
    args = ['windeployqt',
            '{}'.format(pjoin(APP_FILE_TO_DEPLOY)),
            '-qmldir={}'.format(pjoin(QML_DIR)),
            '--release',
            '--verbose', '1']
elif Os() == 'lin':
    args = ['linuxdeployqt',
            '{}'.format(pjoin(APP_FILE_TO_DEPLOY)),
            '-qmldir={}'.format(pjoin(QML_DIR)),
            '-bundle-non-qt-libs']
    #args = ['linuxdeployqt',
    #        '{}'.format(DEPLOY_PATHS[DEPLOY_NAMES.index(APP_FILE)][0]),
    #        '-appimage']
    #result = subprocess.run(args, stdout=subprocess.PIPE).stdout.decode('utf-8')
    #print(result)
else:
    print('ERROR: Unknown OS')
    exit()

# Deploy
result = subprocess.run(args, stdout=subprocess.PIPE).stdout.decode('utf-8')
print(result)
