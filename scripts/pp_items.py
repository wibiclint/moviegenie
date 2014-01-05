# Preprocess item data
# Convert tabs into pipes
# Save only the movieId and title for now.

from datetime import datetime
import sys
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-t', '--timestamp-token', type=int, default=None,
    help='Index of field containing timestamp')

args = parser.parse_args()

for line in sys.stdin:
    toks = line.split('|')
    print('|'.join(toks[0:2]))
