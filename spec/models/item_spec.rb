require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/test_image.png")
  end

   describe '商品出品機能' do
    context  '出品がうまくいくとき' do
      it "image、name、content、category、condition、shipping_fee、shipping_place、shipping_dateとpriceがあれは出品できる" do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がない場合' do
      it "pricが300以上9999999以下ならば出品できる" do
        @item.price = "500"
        expect(@item).to be_valid
      end
    end
  

  context '出品がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "contentが空では登録できない" do
      @item.content = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it "categoryが空では登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "categoryが1では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "conditionが空では登録できない" do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "conditionが1では登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "shipping_feeが空では登録できない" do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
    end
    it "shipping_feeが1では登録できない" do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end
    it "shipping_placeが空では登録できない" do
      @item.shipping_place_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place can't be blank")
    end
    it "shipping_placeが1では登録できない" do
      @item.shipping_place_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place must be other than 1")
    end
    it "shipping_dateが空では登録できない" do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it "shipping_dateが1では登録できない" do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end
    it "imageが空では登録できない" do
    
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'userが紐付いていないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  
  end
 end
end