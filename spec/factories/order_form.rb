FactoryBot.define do
  factory :order_form do
    post_code              { '123-4567' }
    shipping_place_id      { 2 }
    city                   { '東京都' }
    house_num              { '1-1' }
    building               { 'リバーサイド' }
    telephone              { "11111111111" }
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end  