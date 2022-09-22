#!/usr/bin/env bash
function run() {
  SLEEP="10"

  if [ -s "SLEEP_DURATION" ];then
    SLEEP=$(cat SLEEP_DURATION | tr -d '\n')
  fi

  echo "Sleeping for ${SLEEP} seconds"
  sleep ${SLEEP}

  OUTPUT=$(cat <<EOT
  [ { "type"        : "I'm sleeping",
  "message"     : "I just slept for ${SLEEP} seconds",
  "file"        : "README.md",
  "line"        : 0,
  "details_url" : null
}
]
EOT
)

echo ${OUTPUT}

exit 0
}

[[ "$3" = "version" ]] && echo "1"
[[ "$3" = "applicable" ]] && echo "true"
[[ "$3" = "run" ]] && run
[[ -z "$3" ]] && echo '{ "version" : 1, "name" : "json-verifier" }'
exit 0
