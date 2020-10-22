require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context  '購入がうまくいくとき' do
      it "post_code、shipping_place、city、house_num、telephoneとtokenがあれば購入できる" do
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がない場合' do
      it 'buildingは空でも保存できること' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end
  

  context '購入がうまくいかないとき' do
    it "post_codeが空だと登録できない" do
      @order_form.post_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank")
    end
    it "shipping_placeが空では登録できない" do
      @order_form.shipping_place_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Shipping place can't be blank")
    end
    it "shipping_placeが1では登録できない" do
      @order_form.shipping_place_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Shipping place can't be blank")
    end
    it "cityが空では登録できない" do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it "house_numが空では登録できない" do
      @order_form.house_num = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House num can't be blank")
    end
    it "telephoneが空では登録できない" do
      @order_form.telephone = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone can't be blank")
    end
    it "tokenが空では登録できない" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_form.post_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    
  end
 end
end