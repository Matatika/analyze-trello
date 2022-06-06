meltano install extractor "$EXTRACTOR"
meltano install loader "$LOADER"
meltano install transform "$EXTRACTOR"
meltano install transformer dbt

# install dbt deps
meltano invoke dbt deps

# run elt
meltano elt "$EXTRACTOR" "$LOADER" --job_id="$EXTRACTOR"-"$LOADER"-"$IMPORTRUNNERID"

# dbt
meltano invoke dbt snapshot --select tap_trello
meltano invoke dbt run -m tap_trello --full-refresh