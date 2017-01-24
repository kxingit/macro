#!/bin/bash
ls 14* | grep md5sum | rev | cut -c 22- |rev | sort | uniq 
