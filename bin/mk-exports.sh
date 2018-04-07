#!/bin/sh

mkdir -p /export

/bin/ln -s /volume/internal-bay-3a/AppleTimeCapsule /export/.
/bin/ln -s /volume/internal-bay-3a/backups /export/.
/bin/ln -s /volume/internal-bay-3a/jeff /export/.
/bin/ln -s /volume/internal-bay-3a/VirtualBox /export/.

# union 1
/bin/ln -s /volume/union1/audio-books /export/.
/bin/ln -s /volume/union1/itunes /export/.
/bin/ln -s /volume/union1/movies /export/.
/bin/ln -s /volume/union1/music /export/.
/bin/ln -s /volume/union1/photos /export/.
/bin/ln -s /volume/union1/software /export/.
/bin/ln -s /volume/union1/videos /export/.

/bin/ln -s /volume/union0/adult /export/.
/bin/ln -s /volume/union0/priv /export/.






