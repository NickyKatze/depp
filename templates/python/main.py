#! /usr/bin/python3

# basic skeleton of a python script

# base imports
import argparse
import sys
import os

# extra imports

def _command_line_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--path', type=os.path.abspath, required=True, help='point to something')
    parser.add_argument('-e', '--export', type=str, help='will export as provided name')
    return parser.parse_args()

def main():
    args = _command_line_args()
    print(args)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('\nStopping ...')
        sys.exit(1)
