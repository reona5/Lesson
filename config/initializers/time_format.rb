# frozen_string_literal: true

# カスタムフォーマットを定義
Time::DATE_FORMATS[:default] = '%Y/%m/%d %H:%M'
Time::DATE_FORMATS[:datetime] = '%Y/%m/%d %H:%M'
Time::DATE_FORMATS[:date] = '%Y年%m月%d日'
Time::DATE_FORMATS[:time] = '%H時:%M分:%S秒'
Date::DATE_FORMATS[:default] = '%Y年%m月d日'
