#!/usr/bin/env bash
function run() {
  SLEEP="10"

  if [ -s "SLEEP_DURATION" ];then
    SLEEP=$(tr -d '\n' < SLEEP_DURATION)
  fi

  sleep "${SLEEP}"

  OUTPUT=$(cat <<EOT
  [ { "type"        : "Sleep",
  "message"     : "Rip Van Winkle just slept for ${SLEEP} seconds",
  "file"        : "README.md",
  "line"        : 0,
  "details_url" : null
}
]
EOT
)

echo "${OUTPUT}"

exit 0
}

[[ "$3" = "version" ]] && echo "1"
[[ "$3" = "applicable" ]] && echo "true"
[[ "$3" = "run" ]] && run
[[ -z "$3" ]] && echo '{ "version" : 1, "name" : "json-verifier" }'
exit 0
