#! /usr/bin/env python
import argparse
import os

# Script to run pose estimation on an image

if __name__ == '__main__':
    print("Entering Run_pose_estimation")
    parser = argparse.ArgumentParser()
    print("parser runned")
    parser.add_argument('image', type=str, help='input image')
    print("image runned")
    parser.add_argument('--output', type=str, default='.', help='output image')
    print("output runned")
    args = parser.parse_args()
    print("args runned")    

    # Run pose estimation
    os.chdir('keras_Realtime_MultiPerson_Pose_Estimation/')
    print("Heelloooo Fenil")
    os.system(r'python ./extract_keypoints.py --image {} --output {}'.format(args.image, args.output))
    print("Hellooooooooo beta")
    
