#!/bin/bash

ls temps/202* | grep -v ':' | sed 's/.csv//'  | sort | uniq -c | sort -n | sed 's/^ *//' | sed 's/ /;/' | sed 's/$/;/'  > /tmp/projets.list
cat $1 | grep ^2 | awk -F ';' '{print $2}' | while read client; do grep ";$client;" /tmp/projets.list || echo "== nouveau $client ==" ; done
