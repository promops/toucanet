# Правильный flutter analyze, который возвращает код "1" (ошибка) только если хотя бы одна проверка в статусе error.
# Исходная проблема: Flutter 1.17.5 - flutter analyze возвращает код "1" даже если есть только проверки в статусе info.
# Ссылка на issue: https://github.com/flutter/flutter/issues/20855

OUTPUT="$(flutter analyze)"
echo "$OUTPUT"
echo
if grep -q "error •" echo "$OUTPUT"; then
    echo "flutter analyze found errors"
    exit 1
else
    echo "flutter analyze didn't find any errors"
    exit 0
fi