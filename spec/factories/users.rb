FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.last.kanji}
    last_name             {Gimei.last.kanji}
    first_name_kana       {Gimei.last.katakana}
    last_name_kana        {Gimei.last.katakana}
    born                  {Faker::Date.between(from: '1930-01-01', to: '2019-01-01') }
  end
end