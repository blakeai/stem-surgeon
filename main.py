#!/usr/bin/env python3
import argparse
from spleeter.separator import Separator


def parse_args():
    parser = argparse.ArgumentParser(description='Split audio into stems using Spleeter.')

    def valid_stem_count(value):
        n = int(value)
        if n not in {2, 4, 5}:
            raise argparse.ArgumentTypeError(f"{value} is an invalid choice. It must be 2 or 4.")
        return n

    parser.add_argument(
        '-i', '--input',
        type=str, required=True, help='Path to the input audio file.'
    )
    parser.add_argument(
        '-o', '--output',
        type=str,
        default=".",
        help='Path to the output directory.'
    )
    parser.add_argument(
        '-n', "--stem-count",
        dest="stem_count",
        type=valid_stem_count,
        default=2,
        help='Number of stems to split. It can be either 2 or 4. Default is 2.'
    )
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    separator = Separator(f"spleeter:{args.stem_count}stems")
    separator.separate_to_file(audio_descriptor=args.input, destination=args.output)
