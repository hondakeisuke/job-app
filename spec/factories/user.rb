FactoryBot.define do
  factory :user do
    name                   { 'test' }
    email                  { 'test@examlie' }
    password               { 'test000' }
    password_confirmation  { password }
    tell_number            {'09000000000'}
    age                    {22}
    birthday               { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
