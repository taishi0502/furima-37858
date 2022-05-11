FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'ひらがなカタカナ漢字' }
    first_name_kana       { 'カタカナ' }
    last_name             { 'ひらがなカタカナ漢字' }
    last_name_kana        { 'カタカナ' }
    birthday { "2000-10-12" }
  end
end
