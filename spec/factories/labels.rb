FactoryBot.define do
  factory :label do
    labelname { 'ルビー' }
  end
  factory :label2, class: Label do
    labelname { 'サファイア' }
  end
  factory :label3, class: Label do
    labelname { 'パール' }
  end
end
