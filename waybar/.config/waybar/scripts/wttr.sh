#!/usr/bin/env bash

# Requires: curl, jq, date, awk


WEATHER_URL="https://wttr.in/Berlin?format=j1"

# Fetch weather data
weather_json=$(curl -s "$WEATHER_URL")

# Define weather codes (not all are shown for brevity)
declare -A WEATHER_CODES=(
  ["113"]="☀️" ["116"]="⛅️" ["119"]="☁️" ["122"]="☁️"
  ["143"]="🌫" ["176"]="🌦" ["179"]="🌧" ["182"]="🌧"
  ["185"]="🌧" ["200"]="⛈" ["227"]="🌨" ["230"]="❄️"
  ["248"]="🌫" ["260"]="🌫" ["263"]="🌦" ["266"]="🌦"
  ["281"]="🌧" ["284"]="🌧" ["293"]="🌦" ["296"]="🌦"
  ["299"]="🌧" ["302"]="🌧" ["305"]="🌧" ["308"]="🌧"
  ["311"]="🌧" ["314"]="🌧" ["317"]="🌧" ["320"]="🌨"
  ["323"]="🌨" ["326"]="🌨" ["329"]="❄️" ["332"]="❄️"
  ["335"]="❄️" ["338"]="❄️" ["350"]="🌧" ["353"]="🌦"
  ["356"]="🌧" ["359"]="🌧" ["362"]="🌧" ["365"]="🌧"
  ["368"]="🌨" ["371"]="❄️" ["374"]="🌧" ["377"]="🌧"
  ["386"]="⛈" ["389"]="🌩" ["392"]="⛈" ["395"]="❄️"
)

# Extract current condition
current_code=$(echo "$weather_json" | jq -r '.current_condition[0].weatherCode')
feels_like=$(echo "$weather_json" | jq -r '.current_condition[0].FeelsLikeC')
temp_c=$(echo "$weather_json" | jq -r '.current_condition[0].temp_C')
desc=$(echo "$weather_json" | jq -r '.current_condition[0].weatherDesc[0].value')
wind=$(echo "$weather_json" | jq -r '.current_condition[0].windspeedKmph')
humidity=$(echo "$weather_json" | jq -r '.current_condition[0].humidity')

emoji=${WEATHER_CODES[$current_code]:-"❓"}

# Basic text output
text="$emoji $feels_like°"

# Tooltip construction
tooltip="<b>$desc $temp_c°</b>\n"
tooltip+="Feels like: $feels_like°\n"
tooltip+="Wind: $wind Km/h\n"
tooltip+="Humidity: $humidity%\n"

# Process each day (today and tomorrow)
for i in 0 1; do
  day=$(echo "$weather_json" | jq ".weather[$i]")
  date_str=$(echo "$day" | jq -r '.date')
  max_temp=$(echo "$day" | jq -r '.maxtempC')
  min_temp=$(echo "$day" | jq -r '.mintempC')
  sunrise=$(echo "$day" | jq -r '.astronomy[0].sunrise')
  sunset=$(echo "$day" | jq -r '.astronomy[0].sunset')

  if [ "$i" -eq 0 ]; then
    tooltip+="\n<b>Today, "
  elif [ "$i" -eq 1 ]; then
    tooltip+="\n<b>Tomorrow, "
  fi

  tooltip+="$date_str</b>\n⬆️ $max_temp° ⬇️ $min_temp°  $sunrise  $sunset\n"

  # Process hourly data
  hour_count=$(echo "$day" | jq '.hourly | length')
  current_hour=$(date +"%H")

  for ((j = 0; j < hour_count; j++)); do
    hour=$(echo "$day" | jq ".hourly[$j]")
    raw_time=$(echo "$hour" | jq -r '.time')
    formatted_time=$(printf "%02d" $((10#$raw_time / 100)))

    # Only show future hours for today
    if [ "$i" -eq 0 ] && [ "$formatted_time" -lt $((10#$current_hour - 2)) ]; then
      continue
    fi

    hour_code=$(echo "$hour" | jq -r '.weatherCode')
    hour_emoji=${WEATHER_CODES[$hour_code]:-"❓"}
    hour_feels=$(echo "$hour" | jq -r '.FeelsLikeC')
    hour_desc=$(echo "$hour" | jq -r '.weatherDesc[0].value')

    # Chance fields
    conditions=""
    for key in fog frost overcast rain snow sunshine thunder windy; do
      field="chanceof${key}"
      value=$(echo "$hour" | jq -r ".${field}")
      if [ "$value" != "0" ]; then
        label=$(echo "$key" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')
        conditions+="${label} ${value}%, "
      fi
    done
    conditions=${conditions%, }

    tooltip+="$formatted_time $hour_emoji ${hour_feels}° $hour_desc, $conditions\n"
  done
done

# Output result as JSON
printf '{"text": "%s", "tooltip": "%s"}\n' "$text" "$tooltip"
