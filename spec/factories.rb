FactoryGirl.define do
  factory :user do
    name     "ian root"
    email    "ian@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end