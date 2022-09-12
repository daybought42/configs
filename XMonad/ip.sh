#!/bin/bash

resolvectl query archXmonad | grep archXmonad | awk '{print $2}'
