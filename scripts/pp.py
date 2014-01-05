# Preprocess user data
# Convert tabs into pipes
# Turn timestamps from ms since epoch into a string that C* will like

from datetime import datetime
import sys
import argparse

parser = argparse.ArgumentParser()

parser.add_argument('-t', '--timestamp-token', type=int, default=None,
    help='Index of field containing timestamp')

args = parser.parse_args()

for line in sys.stdin:
  toks = line.split('\t')

  if args.timestamp_token != None:

    dt = datetime.fromtimestamp(int(toks[args.timestamp_token]))
    toks[args.timestamp_token] = dt.strftime('%Y-%m-%d %H:%M:%S')

  print('|'.join(toks))
