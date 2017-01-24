#!/bin/bash

# This script writes and verifies a segy file to a tape

module add production prod

# Attempt to find the path to the actual installed script, hence all the java files
export realScript=$(readlink -f $(which --skip-functions --skip-alias "$0") || echo "$0")
export scriptName=$(basename "$realScript")
export scriptDir=$(dirname "$realScript")
export fullDir=$(cd "$scriptDir" && echo "$PWD") || die "Can not determine directory where script is located: $0"
[[ -e "$fullDir/$scriptName" ]] || die "Can not determine directory where script is located: $0"

export PATH=${scriptDir}:${scriptDir}/scripts:${scriptDir}/bin:/d/sw/Nemo/latest/bin/:/d/sw/xxhash/latest/bin/:$PATH

# useful functions
msg () { echo "$@" >&2; }

die () { msg "$@"; exit 100; }

usage="usage: $(basename $0) tape=... < filelist.txt"

set -o pipefail

# expect 1 arguments

(( $# != 1 )) && die "$usage"
tty -s && die "$usage"

# Process arguments
CL_PARAMS="tape"
. command-line

[ -z "$tape" ] && die "$usage"

cat > TAR_files1.txt || die writing lto file list
export tarFileSize=$(<TAR_files1.txt tr -s '\n' '\0' | du -Lbcs --files0-from=- | awk '$2=="total" {print $1}')

# set the block size of the tape to 10240 to match tar
mt -f $tape rewind || die rewiding tape 1
#mt -f $tape setblk 10240 || die set tape block size 1
#dd if=/dev/zero of=$tape bs=10240 count=1 || die writing 10240 bytes
#mt -f $tape rewind || die rewinding tape 2
#mt -f $tape setblk 10240 || die set tape block size 2

# write the tar file
export tarChkSumFile=TAR_chksum1.sum
tar --use-compress-program tarChkSum -cvhf $tape --files-from=TAR_files1.txt || die writing tape

mt -f $tape rewind || die rewinding tape 3

# read the tar file
export tarChkSumFile=TAR_chksum2.sum
tar  --use-compress-program tarChkSum -tf $tape > TAR_files2.txt || die reading tape

diff -qbBi TAR_files1.txt TAR_files2.txt || die verifying file list
diff -qbBi TAR_chksum1.sum TAR_chksum2.sum || die verifying checksums

