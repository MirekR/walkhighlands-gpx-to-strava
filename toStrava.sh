gpx_source=$1
gpx_strava="${gpx_source}_strava.gpx"

today=$(date +"%Y-%m-%d")

cp ${gpx_source} ${gpx_strava}

sed -i 's|<rte>|<trk><trkseg>|g' ${gpx_strava}
sed -i 's|</rte>|</trkseg></trk>|g' ${gpx_strava}

sed -i 's|<rtept|<trkpt|g' ${gpx_strava}
sed -i "s|</rtept>|<time>${today}T07:07:07Z</time></trkpt>|g" ${gpx_strava}
